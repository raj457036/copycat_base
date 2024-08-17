import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/constants/widgets.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image/image.dart' as img;
import "package:universal_io/io.dart";

final mediaMimeRegex = RegExp("video|image|audio");

class MediaClipCard extends StatelessWidget {
  final ClipboardItem item;

  const MediaClipCard({super.key, required this.item});

  Widget getPreview() {
    final isImage = item.fileMimeType!.startsWith("image");
    if (!isImage) {
      return placeholderImage;
    }

    if (item.localPath != null) {
      if (item.fileMimeType!.contains("svg")) {
        return SvgPicture.file(
          File(item.localPath!),
          width: 480,
        );
      }
      return Image(
        image: ResizeImage(
          FileImage(File(item.localPath!)),
          width: 480,
          policy: ResizeImagePolicy.fit,
        ),
        gaplessPlayback: true,
        fit: BoxFit.cover,
      );
    }
    if (item.imgBlurHash == null) {
      return placeholderImage;
    }

    try {
      final image_ = BlurHash.decode(item.imgBlurHash!).toImage(35, 20);
      final bin = Uint8List.fromList(img.encodeJpg(image_));
      return Image.memory(
        bin,
        gaplessPlayback: true,
        fit: BoxFit.cover,
      );
    } catch (e) {
      return placeholderImage;
    }
  }

  Widget getIcon(BuildContext context) {
    if (item.fileMimeType != null) {
      if (item.fileMimeType!.startsWith(mediaMimeRegex)) {
        final label = "${item.fileMimeType!} • ${formatBytes(item.fileSize!)}";
        return Chip(
          label: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          side: BorderSide.none,
        );
      }
    }
    return const Icon(
      Icons.image,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radiusBottom12,
      child: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(child: getPreview()),
            Align(
              alignment: const Alignment(0.0, 0.95),
              child: getIcon(context),
            ),
          ],
        ),
      ),
    );
  }
}
