import 'dart:async';
import 'dart:math' show Random;

import 'package:easy_worker/easy_worker.dart';
import 'package:encrypt/encrypt.dart';
import 'package:uuid/uuid.dart';

String generateSecurePassword(int length) {
  const String upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz';
  const String digits = '0123456789';
  const String specialCharacters = '!@#\$%^&*()-_=+[]{}|;:,.<>?';

  final Random random = Random.secure();

  // Ensure the password contains at least one character from each set
  List<String> passwordChars = [
    upperCaseLetters[random.nextInt(upperCaseLetters.length)],
    lowerCaseLetters[random.nextInt(lowerCaseLetters.length)],
    digits[random.nextInt(digits.length)],
    specialCharacters[random.nextInt(specialCharacters.length)],
  ];

  // Fill the remaining length of the password with random characters from all sets
  String allChars =
      upperCaseLetters + lowerCaseLetters + digits + specialCharacters;
  for (int i = 4; i < length; i++) {
    passwordChars.add(allChars[random.nextInt(allChars.length)]);
  }

  // Shuffle the password characters to ensure randomness
  passwordChars.shuffle(random);

  // Convert the list of characters to a string and return
  return passwordChars.join();
}

class EncryptionSecret {
  final String secret;
  final String init;
  late final Key key;
  late final IV iv;

  EncryptionSecret(
    this.secret,
    this.init,
  ) {
    key = Key.fromUtf8(secret);
    iv = IV.fromBase64(init);
  }

  factory EncryptionSecret.generate() {
    const secretKeyLength = 32;
    const ivLength = 16;
    final secret = generateSecurePassword(secretKeyLength);
    final iv = IV.fromLength(ivLength);
    return EncryptionSecret(secret, iv.base64);
  }

  String get serialized => "$secret-+-$init";

  factory EncryptionSecret.deserilize(String serialized) {
    final List<String> split = serialized.split("-+-");

    if (split.length != 2) {
      throw Exception("Invalid serialized secret");
    }

    return EncryptionSecret(
      split[0],
      split[1],
    );
  }
}

class EncryptionManager {
  late final IV _iv;
  late final Encrypter encrypter;

  EncryptionManager(EncryptionSecret secret) {
    _iv = secret.iv;
    encrypter = Encrypter(AES(secret.key, mode: AESMode.cfb64));
  }

  String encrypt(String content) {
    return encrypter.encrypt(content, iv: _iv).base64;
  }

  String decrypt(String content) {
    return encrypter.decrypt64(content, iv: _iv);
  }
}

Encrypter? _aesEncrypter;
EncryptionSecret? _encSecret;

enum EncDecType {
  encrypt,
  decrypt,
  ping,
}

typedef EncryptionPayload = (
  String id,
  String content,
  String secret,
  EncDecType action
);

void _encryptorEntryPoint(
  EncryptionPayload payload,
  Sender send,
) {
  final (id, content, secret, action) = payload;
  if (id == "") return;

  if (id != "PING") {
    _encSecret ??= EncryptionSecret.deserilize(secret);
    _aesEncrypter ??= Encrypter(
      AES(
        _encSecret!.key,
        mode: AESMode.cfb64,
      ),
    );
  }

  switch (action) {
    case EncDecType.encrypt:
      final encrypted = _aesEncrypter!.encrypt(content, iv: _encSecret!.iv);
      send((id, encrypted.base64));

    case EncDecType.decrypt:
      final decrypted = _aesEncrypter!.decrypt64(content, iv: _encSecret!.iv);
      send((id, decrypted));

    case EncDecType.ping:
      send(("PING", "PONG"));
  }
}

class DecryptionException implements Exception {
  final String code;
  final String message;

  DecryptionException(this.message, {this.code = "not-active"});
}

class EncryptionException implements Exception {
  final String code;
  final String message;

  EncryptionException(this.message, {this.code = "not-active"});
}

class EncryptionWorker {
  Completer? _completer;
  bool _isRunning = false;
  bool _isStarting = false;
  bool _encryption = false;
  bool _decryption = true;

  String? secret;
  final Map<String, Completer> _tasks = <String, Completer>{};

  EasyWorker? _encryptor;

  StreamSubscription? _subscription;

  EncryptionWorker._();

  static final EncryptionWorker _instance = EncryptionWorker._();
  static EncryptionWorker get instance => _instance;

  bool get isRunning => _isRunning;
  bool get isStarting => _isStarting;
  bool get isEncryptionActive => _encryption;
  bool get isDecryptionActive => _decryption;

  void dispose() {
    if (!_isRunning) return;
    _isRunning = false;
    _subscription?.cancel();
    _encryptor?.dispose();
    _encryptor = null;
  }

  void setEncryption(bool value) {
    _encryption = value;
  }

  void setDecryption(bool value) {
    _decryption = value;
  }

  Future<void> start(String secret) async {
    if (_completer != null || _isRunning) return;
    _completer = Completer();
    _isStarting = true;
    try {
      _isRunning = false;
      this.secret = secret;
      _subscription?.cancel();
      _encryptor = EasyWorker<(String, String), EncryptionPayload>(
        Entrypoint(_encryptorEntryPoint),
        workerName: "Encryptor Worker",
      );

      await _encryptor?.waitUntilReady();
      _subscription = _encryptor?.onMessage((p0) {
        final (id, content) = p0;
        _tasks.remove(id)?.complete(content);
        if (id == "PING" && content == "PONG") _completer?.complete();
      });
      await _encryptor?.send(("PING", "PING", "PING", EncDecType.ping));
      _isRunning = true;
    } finally {
      _isStarting = false;
    }
  }

  Future<void> waitUntilReady() async {
    if (_completer == null || (_completer?.isCompleted ?? true)) return;
    await _completer?.future;
  }

  Future<String> encrypt(String content) async {
    if (secret == null) {
      throw EncryptionException("Secret is not set", code: "invalid-secret");
    }
    if (_encryptor == null) {
      throw EncryptionException("Encryptor is not running");
    }
    if (!_encryption) {
      throw EncryptionException("Encryption is not active");
    }
    final id = const Uuid().v4();
    final completer = Completer<String>();
    _tasks[id] = completer;
    await _encryptor?.send(
      (id, content, secret!, EncDecType.encrypt),
    );
    return completer.future;
  }

  Future<String> decrypt(String content) async {
    if (secret == null) {
      throw DecryptionException("Secret is not set", code: "invalid-secret");
    }
    if (_encryptor == null) {
      throw DecryptionException("Encryptor is not running");
    }
    if (!_decryption) {
      throw DecryptionException("Decryption is not active");
    }
    final id = const Uuid().v4();
    final completer = Completer<String>();
    _tasks[id] = completer;
    await _encryptor?.send(
      (id, content, secret!, EncDecType.decrypt),
    );
    return completer.future;
  }
}
