import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'CopyCat';

  @override
  String get en => 'English';

  @override
  String get es => 'Spanish';

  @override
  String get fr => 'French';

  @override
  String get de => 'German';

  @override
  String get zh => '简体中文';

  @override
  String get zh_cn => '简体中文';

  @override
  String get language => '语言';

  @override
  String get enterEmail => '请输入你的邮箱';

  @override
  String get validEmailError => '请输入有效的电子邮件地址';

  @override
  String get enterPassword => '输入您的密码';

  @override
  String get passwordLengthError => '请输入至少6个字符的密码';

  @override
  String get signIn => '登录';

  @override
  String get signUp => '注册';

  @override
  String get forgotPassword => '忘记密码了？';

  @override
  String get dontHaveAccount => '没有账户？注册';

  @override
  String get haveAccount => '已经有帐户？登录';

  @override
  String get sendPasswordReset => '发送密码重置邮箱';

  @override
  String get backToSignIn => '返回登录';

  @override
  String get updatePassword => '更新密码';

  @override
  String get unexpectedError => '发生了意外错误';

  @override
  String get passwordResetSent => '密码重置电子邮件已发送';

  @override
  String get collections => '收藏';

  @override
  String get collection => '收藏';

  @override
  String get createCollection => '创建集合';

  @override
  String get editCollection => '编辑集合';

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get edit => '编辑';

  @override
  String get description => '描述';

  @override
  String get noDescription => '无描述';

  @override
  String get noResultsWereFound => '没有找到结果';

  @override
  String get driveSetupDone => '驱动安装完成 🥳';

  @override
  String get pleaseWaitWhileWeSetupSyncing => '请稍候，我们正在设置同步';

  @override
  String get driveSetupMayTakeFewMin => '这可能需要大约一分钟才能完成。\n（请不要关闭应用）';

  @override
  String get refreshNow => '立即刷新';

  @override
  String newUpdates(int added, int updated, int deleted) {
    return '可用的更改：\n $added 已添加， $updated 已更新和 $deleted 已删除';
  }

  @override
  String get itemDeleted => '项目已删除';

  @override
  String get deletingFromCloud => '从云端删除';

  @override
  String get emptyClipboard => '你的剪贴板为空';

  @override
  String get loadMore => '加载更多';

  @override
  String get clipboard => '剪贴板';

  @override
  String get search => '搜索';

  @override
  String get share => '分享';

  @override
  String get export => '出口';

  @override
  String get searchClipboard => '搜索剪贴板';

  @override
  String get settings => '设置';

  @override
  String get copyCatClipboard => 'CopyCat剪贴板';

  @override
  String get oneClipboardLimitlessPosibility => '一个剪贴板，无限可能';

  @override
  String get fullName => '全名';

  @override
  String get preview => '预览';

  @override
  String get editDetails => '编辑详情';

  @override
  String get title => '标题';

  @override
  String get nothingHere => '这里什么都没有';

  @override
  String get downloading => '下载中';

  @override
  String get downloadForOffline => '下载供离线使用';

  @override
  String get copyToClipboard => '复制到剪贴板';

  @override
  String get delete => '删除';

  @override
  String get resetYourPassword => '重设您的密码';

  @override
  String get passwordResetSuccess => '密码重置成功';

  @override
  String get findWhateverYouLooking => '找到你想找的任何东西...';

  @override
  String get noResults => '没有找到结果。';

  @override
  String get searchInClipboard => '在剪贴板中搜索';

  @override
  String get basicLocal => '基本 • 本地';

  @override
  String get localSettingsDesc => '这些设置仅适用于此设备。';

  @override
  String get theme => '主题';

  @override
  String get syncLocal => '同步 • 本地';

  @override
  String get dontAutoCopyOver => '不要自动复制粘贴';

  @override
  String dontAutoCopyOverDesc(String size) {
    return '超出一定大小 ($size) 的文件和媒体不会自动复制。';
  }

  @override
  String get dontAutoUploadOver => '不自动上传结束';

  @override
  String dontAutoUploadOverDesc(String size) {
    return '超过一定大小 ($size) 的文件和媒体不会自动上传。';
  }

  @override
  String get enableSync => '启用同步';

  @override
  String get enableSyncDesc => '跨设备同步您的剪辑';

  @override
  String get syncFiles => '同步文件和媒体';

  @override
  String get syncFilesDesc => '在各个设备上使您的文件和媒体项目保持更新。';

  @override
  String get connected => '已连接';

  @override
  String get loading => '加载中...';

  @override
  String get authorizing => '正在授权...';

  @override
  String get connectNow => '立即连接';

  @override
  String get tips => '小提示';

  @override
  String get cloudStorageInfoDefault => 'Google 云盘未连接，文件和媒体同步已禁用。';

  @override
  String cloudStorageInfo(String info) {
    return '$info您的文件和媒体通过Google Drive安全地跨设备同步，以保护您的隐私。';
  }

  @override
  String get attentionNeeded => '⚠ 需要注意！';

  @override
  String get isPaused => '是否暂停？';

  @override
  String isPausedDesc(String isPaused, String till) {
    String _temp0 = intl.Intl.selectLogic(
      isPaused,
      {
        'true': '自动复制未暂停',
        'other': '自动复制已暂停，直到 $till',
      },
    );
    return '$_temp0';
  }

  @override
  String get paste => '粘贴';

  @override
  String get copy => '复制';

  @override
  String get previewEdit => '预览和编辑';

  @override
  String get pastingTheSharedContent => '將共享內容粘貼到剪貼簿';

  @override
  String get smartPaste => '智能粘贴';

  @override
  String get smartPasteDesc => '启用直接将剪贴板内容粘贴到上一个焦点窗口的功能。';

  @override
  String get launchAtStartup => '启动时运行';

  @override
  String get launchAtStartupDesc => '启用后，可在您的设备启动时自动启动该应用。';

  @override
  String get autoSyncInterval => '自动同步间隔';

  @override
  String get autoSyncIntervalDesc => '剪贴板将自动同步';

  @override
  String get clipboardShortcut => '剪贴板快捷方式';

  @override
  String get clipboardShortcutDesc => '轻松在任何地方访问剪贴板';

  @override
  String clipboardShortcutPreview(String key) {
    return '当前快捷键：$key';
  }

  @override
  String get unassigned => '未分配';

  @override
  String get system => '系统';

  @override
  String get light => '光';

  @override
  String get dark => '黑暗';

  @override
  String get local => '本地的';

  @override
  String get uploading => '上传中...';

  @override
  String get pleaseWait => '请稍候...';

  @override
  String get open => '打开';

  @override
  String get noCollection => '无收藏';

  @override
  String get chooseCollection => '选择收藏';

  @override
  String get changeCollection => '改变集合';

  @override
  String get removeFromCollection => '从收藏夹中移除';

  @override
  String get compactMode => '紧凑模式';

  @override
  String createACollection(String left) {
    return '创建新集合 ( $left 剩余 )';
  }

  @override
  String get logout => '退出登录';

  @override
  String get logoutMessage => '⚠️ 警告 ⚠️\n\n注销将会删除本地数据库中未同步的更改。您确定要继续吗？';

  @override
  String get loggingYouOut => '正在登出！请稍等...';

  @override
  String get logoutSuccess => '退出成功';

  @override
  String get internetConnected => '已连接到云端';

  @override
  String get internetDisconnected => '正在连接到云端...';

  @override
  String get noCollectionFound => '未找到集合';

  @override
  String get done => '完成';

  @override
  String get failed => '失败';

  @override
  String get syncNow => '立即同步';

  @override
  String get syncNotAvailable => '同步不可用';

  @override
  String get checkingForRecord => '检查记录';

  @override
  String get sync => '同步';

  @override
  String get syncing => '同步中';

  @override
  String syncingCheckFailed(String message) {
    return '同步检查失败：$message';
  }

  @override
  String get synced => '✅ 更改同步';

  @override
  String get showWindow => '显示窗口';

  @override
  String get hideWindow => '隐藏窗口';

  @override
  String get hideWindowDesc => '提示：使用键盘快捷键显示剪贴板。';

  @override
  String get quit => '退出';

  @override
  String get quitDesc => '您确定要退出吗？';

  @override
  String get yes => '是的';

  @override
  String get no => '没有';

  @override
  String get openInBrowser => '在浏览器中打开';

  @override
  String get makePhoneCall => '打电话';

  @override
  String get selectCollection => '选择一个集合';

  @override
  String get selectCollectionSub => '或者创建一个新的';

  @override
  String get confirm => '确认';

  @override
  String get recordKeyboardShortcut => '记录键盘快捷键。';

  @override
  String get recordKeyboardShortcutDesc => '使用键盘输入您的快捷键并点击';

  @override
  String get subscription => '订阅';

  @override
  String get beta => '公开测试版';

  @override
  String get featureListDetail =>
      'CopyCat 剪贴板目前处于Beta阶段。虽然我们努力提供无缝的体验，但您可能会遇到偶尔的错误。敬请关注即将推出的功能和增强功能。';

  @override
  String get currentPlan => '当前计划';

  @override
  String currentPlanLabel(String label) {
    return '当前计划 • $label';
  }

  @override
  String get included => '包含';

  @override
  String get unlimitedClipboardItems => '无限剪贴板项目';

  @override
  String get unlimitedClipboardItemsDesc =>
      '永远不会因为空间不足而有任何限制，无限的剪贴板项，确保你始终可以访问最近复制的内容。';

  @override
  String get supportAllMajorPlatforms => '支持所有主要平台';

  @override
  String get supportAllMajorPlatformsDesc =>
      '在所有主要平台（Android、iOS、Windows、macOS、Linux）之间无缝同步，以确保在任何地方不间断地工作效率。';

  @override
  String get supportsAppleUniversalClipboard => '支持Apple通用剪贴板';

  @override
  String get supportsAppleUniversalClipboardDesc =>
      '轻松在您的苹果设备之间传输剪贴板内容，支持苹果通用剪贴板。';

  @override
  String get onDeviceStorage => '设备存储';

  @override
  String get onDeviceStorageDesc =>
      '通过设备存储保持您的数据安全，确保您的剪贴板项目始终在您触手可及的范围内，并且处于您的控制之下。';

  @override
  String get googleDriveIntegration => 'Google 云盘集成';

  @override
  String get googleDriveIntegrationDesc =>
      '在Google Drive上安全存储文件和媒体，与CopyCat剪贴板无缝集成，以增强数据管理。';

  @override
  String get instantSearch => '立即搜索';

  @override
  String get instantSearchDesc => '通过强大的即时搜索功能，即刻找到您所需的内容，使剪贴板项目的检索快速高效。';

  @override
  String get syncingUpToLast24Hours => '同步至前 24 小时';

  @override
  String get syncingUpToLast24HoursDesc =>
      '在所有设备上访问和同步过去 24 小时内的剪贴板历史记录。这样可以确保您永远不会丢失重要的复制项，使您的工作流顺畅高效。';

  @override
  String get upTo3Collections => '最多 3 个集合';

  @override
  String get upTo3CollectionsDesc => '将您的剪贴板条目组织成最多 3 个集合，从而提供简单的分类以更好地管理工作流程。';

  @override
  String get autoSyncEvery45Seconds => '自动同步 每45秒钟';

  @override
  String get autoSyncEvery45SecondsDesc =>
      '享受剪贴板项目每45秒自动同步的功能，无需手动干预即可保持您的设备处于最新状态。';

  @override
  String get withPro => '与 PRO ✨';

  @override
  String get withProDesc => '包含免费版中的所有内容 +';

  @override
  String get supportE2EE => '支持端到端加密';

  @override
  String get supportE2EEDesc => 'E2EE 将使一切都加密，从而提供卓越的隐私保护。';

  @override
  String get upto50Collection => '最多 50 个集合';

  @override
  String get upto50CollectionDesc => '将剪贴板条目组织到最多 50 个集合中，以实现最终管理。';

  @override
  String get syncLast720Hr => '同步至过去 30 天';

  @override
  String get syncLast720HrDesc =>
      '剪贴板历史记录会在您所有设备上同步最近 30 天内创建的剪贴内容。这意味着您可以访问过去一个月内复制的任何剪贴内容，无论您使用哪个设备。';

  @override
  String get realtimeSync => '实时同步';

  @override
  String get realtimeSyncDesc => '体验闪电般快速的同步。';

  @override
  String get prioritySupport => '更快和优先的支持';

  @override
  String get prioritySupportDesc => '作为PRO用户，获得及时和优先的支持。';

  @override
  String get earlyAccessToNewFeature => '新功能的早期访问';

  @override
  String get earlyAccessToNewFeatureDesc => '成为第一个尝试新功能和更新的人。';

  @override
  String get termsAgreeP1 => '继续即表示您同意以下内容';

  @override
  String get privacyPolicies => '隐私政策';

  @override
  String get and => '和';

  @override
  String get termsOfService => '服务条款';

  @override
  String get termsAgreeP2 => '看起来你并没有提供英文文本，请提供文本以便我为您翻译成中文。';

  @override
  String get backToApp => '返回应用程序';

  @override
  String get experimental => '🧪';

  @override
  String get experimentalDescription => '该功能是实验性的，可能无法按照预期工作。';

  @override
  String get selectAnOption => '选择一个选项';

  @override
  String get advanceSecurity => '先进安全性';

  @override
  String get endToEndVault => '端到端加密库';

  @override
  String get accessE2eeVault => '访问您的端到端加密保险箱设置';

  @override
  String get encryptClipboard => '加密剪贴板';

  @override
  String get encryptClipboardDesc => '在与云端同步之前加密剪贴板。';

  @override
  String get $5Sec => '即时';

  @override
  String get $10Sec => '快速的';

  @override
  String get $20Sec => '迅速';

  @override
  String get $45Sec => '平衡的';

  @override
  String get $60Sec => '休闲';

  @override
  String get $5MB => '5 MB';

  @override
  String get $10MB => '10 MB';

  @override
  String get $20MB => '20 MB';

  @override
  String get $50MB => '50 MB';

  @override
  String get $100MB => '100 MB';

  @override
  String get e2eeNotSetup => '尚未设置端到端加密。';

  @override
  String get settingE2eeVault => '设置 E2EE 保险库';

  @override
  String get e2eeSetupWarning =>
      '如果您丢失了您的 E2EE 密钥且没有备份，您的加密数据将永久无法访问。请确保您的密钥安全并备份。';

  @override
  String get e2eeSetupDesc =>
      '生成您的 E2EE 保管库密钥并将其保存在安全的位置。您将需要此密钥来设置其他设备以访问您的加密信息。';

  @override
  String get generating => '生成中...';

  @override
  String get generateKey => '生成 E2EE 保险箱密钥';

  @override
  String get importE2eeKey => '导入 E2EE 保管库密钥';

  @override
  String get importE2eeInvalidKey => '⚠️ 导入的密钥无效！';

  @override
  String get importE2eeDesc =>
      '在下方导入您的E2EE保险柜密钥，以启用对您在此设备上加密信息的访问。请确保密钥安全存储并且不与任何人共享。';

  @override
  String get importing => '导入中...';

  @override
  String get importKey => '导入 E2EE 保管库密钥';

  @override
  String get e2eeVault => 'E2EE保险库';

  @override
  String get e2eeExportNote => '恭喜，您已成功配置了端到端加密。';

  @override
  String get e2eeExportDesc =>
      '点击下面的按钮导出您的E2EE保险库密钥。\n请将密钥存储在安全的位置，以确保您能够在其他设备上设置访问加密信息。';

  @override
  String get exportKey => '导出 E2EE 保险箱密钥';

  @override
  String get exportSuccess => '✅ 导出成功';

  @override
  String get copySuccess => '✅ 已成功复制到剪贴板';

  @override
  String get whatsNew => '有什么新鲜事？';

  @override
  String get feature1 => '停靠和窗口视图';

  @override
  String get feature1Desc => '现在，您可以将剪贴板停靠在任何边缘或像往常一样浮动。';

  @override
  String get feature2 => '剪辑的列表和网格视图';

  @override
  String get feature2Desc => '在支持的窗口大小中，您现在可以在列表和网格视图之间进行选择。';

  @override
  String get feature3 => '排除规则';

  @override
  String get feature3Desc => '精确控制不复制到剪贴板的内容。';

  @override
  String get feature4 => '批量操作';

  @override
  String get feature4Desc => '现在选择多个剪辑并执行批量操作。';

  @override
  String get gettingStarted => '开始使用';

  @override
  String get howToUse => '如何使用';

  @override
  String get howToUseDesc => '如何使用CopyCat？ 阅读我们的文档以开始使用。';

  @override
  String get tutorials => '视频教程';

  @override
  String get tutorialsDesc => '通过我们的逐步视频教程，学习如何充分利用 CopyCat。';

  @override
  String get learnAboutFeatures => '了解 CopyCat 所提供的所有功能。';

  @override
  String get learn => '学习';

  @override
  String get upgrade => '升级';

  @override
  String trialTill(String till) {
    return '试用到期 $till';
  }

  @override
  String expiredPlan(String planName) {
    return '$planName • 已过期';
  }

  @override
  String get displayName => '显示名称';

  @override
  String get email => '电子邮件';

  @override
  String get accountSettings => '帐户设置';

  @override
  String get dangerZone => '危险区域';

  @override
  String get requestAccountDeletion => '请求删除账户';

  @override
  String get myAccount => '我的账户';

  @override
  String get accountDeleteDialogTitle => '帐户删除请求';

  @override
  String get accountDeleteDialogDesc => '您将被重定向至账户删除请求表格，您确定吗？';

  @override
  String get unlockPremiumFeatures => '解锁 CopyCat PRO';

  @override
  String get upgradeToPro =>
      '享受超过 30 天的同步历史记录、超过 50 个收藏夹、端到端加密、实时同步、访问最新功能等更多内容。';

  @override
  String get tryAgain => '请再试一次';

  @override
  String get continue_ => '继续';

  @override
  String get year => '年份';

  @override
  String get month => '月份';

  @override
  String get manageSubscriptions => '管理订阅';

  @override
  String promoSub(String till) {
    return '您目前正在使用促销订阅，有效期至 $till';
  }

  @override
  String get subscriptionUpdated => '订阅已更新';

  @override
  String get grantedEntitlement => '已授予的权利';

  @override
  String get grantedEntitlementDesc =>
      '已授予权限代码与特定个人共享，用于自定义权限。您可以通过查看邀请是否仍然可用来进行检查';

  @override
  String get clickingHere => '点击这里。';

  @override
  String get enterCodeSubmit => '输入验证码并点击提交';

  @override
  String get submit => '提交';

  @override
  String get subscribeInSupportedPlatform =>
      '要在Copycat Clipboard上访问高级功能，请通过Play Store或Apple App Store订阅。您的订阅将在所有设备（包括Linux和Windows）上同步。';

  @override
  String get timeSyncWarning => '⚠️ 时间同步警告';

  @override
  String get timeSyncWarningNote1 => '检测到设备时间不一致';

  @override
  String get timeSyncWarningNote2 => '要确保剪贴板同步的准确性，请检查并纠正您的设备时间设置。';

  @override
  String get timeSyncWarningNote3 => '时间设置不一致可能会导致同步问题。';

  @override
  String get checkAgain => '重新检查';

  @override
  String get shareYourFeedback => '分享您的反馈';

  @override
  String get shareYourFeedbackDesc =>
      '我們重視您的想法！無論是建議、錯誤報告，還是只是打個招呼，您的意見對我們都無比寶貴。';

  @override
  String get joinDiscord => '加入我们的 Discord 社区';

  @override
  String get joinDiscordDesc => '与其他用户建立联系，分享想法，获取更新，并与我们直接聊天。';

  @override
  String get joinGoogleGroup => '加入我们的谷歌群组';

  @override
  String get joinGoogleGroupDesc => '在我们的Google小组中获取资讯并与其他用户合作';

  @override
  String get rebuildingDB => '重建数据库中，请稍候...';

  @override
  String get proTip => '专业提示';

  @override
  String get useCollectionProTip =>
      '为了确保您的重要剪辑无论何时都可以访问，在所有您的设备上，请将它们保存在一个集合中！';

  @override
  String get syncConfigNotAvailable => '使用本地剪贴板时，同步相关的配置不可用。';

  @override
  String get useLocally => '本地使用';

  @override
  String get useLocallyDesc => '不进行同步。所有数据都保留在您的设备上。';

  @override
  String maxDroppableItem(int count) {
    return '一次最多允许丢弃$count件物品。';
  }

  @override
  String get dropHere => '在这里拖放您的文件、图片或文本';

  @override
  String get general => '一般';

  @override
  String get customization => '定制';

  @override
  String get syncingLabel => '同步';

  @override
  String get encryption => '加密';

  @override
  String get searchFilters => '搜索过滤器';

  @override
  String get from => '来自';

  @override
  String get to => '至／到';

  @override
  String get now => '现在';

  @override
  String get including => '包括';

  @override
  String get text => '文本';

  @override
  String get url => '统一资源定位符';

  @override
  String get media => '媒体';

  @override
  String get docs => '文档';

  @override
  String get textCategories => '文本类别';

  @override
  String get exclusive => '（独家）';

  @override
  String get phone => '电话';

  @override
  String get color => '颜色';

  @override
  String get sortBy => '排序方式';

  @override
  String get select => '选择';

  @override
  String get lastModified => '最后修改时间';

  @override
  String get created => '创建';

  @override
  String get copyCount => '复制计数';

  @override
  String get lastCopied => '最近复制的';

  @override
  String get sortOrder => '排序顺序';

  @override
  String get asc => '升';

  @override
  String get desc => '描述';

  @override
  String get applyFilter => '应用过滤器';

  @override
  String get themeColor => '主题颜色';

  @override
  String get themeColorDesc => '这个颜色将会影响应用程序的整体外观和体验。';

  @override
  String get change => '改变';

  @override
  String get colorMode => '颜色模式';

  @override
  String get colorModeDesc => '选择颜色模式来定制应用的外观。默认选项是色调斑点。';

  @override
  String get tonalSpot => '色调斑点';

  @override
  String get content => '内容';

  @override
  String get expressive => '富有表现力的';

  @override
  String get fidility => '保真度';

  @override
  String get fruitSalad => '水果沙拉';

  @override
  String get monochrome => '单色';

  @override
  String get neutral => '中立的';

  @override
  String get rainbow => '彩虹';

  @override
  String get vibrant => '鲜艳的';

  @override
  String get customExclusionRuleFeature => '自定义排除规则';

  @override
  String get customExclusionRuleFeatureDesc => '精确控制剪贴板。允许您定义复制内容、复制来源以及复制时间。';

  @override
  String get dragNDropFeature => '拖拽';

  @override
  String get dragNDropFeatureDesc => '在您的桌面和平板设备上无缝地移动项目。';

  @override
  String get experimentalLabel => '实验性的';

  @override
  String get dragNdrop => '拖放';

  @override
  String get dragNdropDesc => '允许项目在应用程序内双向自由移动。';

  @override
  String get featureNotSupported => '抱歉，這個功能目前在您的平台上不可用。';

  @override
  String get themingFeature => '主题化';

  @override
  String get themingFeatureDesc => '自定义整个应用程序的外观和感觉，以符合您的偏好。';

  @override
  String get resetSearch => '重置搜索';

  @override
  String get security => '安全';

  @override
  String get exclusionRules => '排除规则';

  @override
  String get exclusionRulesDesc => '防止信息复制到剪贴板。点击进行高级控制。';

  @override
  String get predefinedExclRules => '预定义排除规则';

  @override
  String get passwordManagers => '密码管理器';

  @override
  String get commonPasswordPatterns => '常见密码模式';

  @override
  String get creditCardNumber => '信用卡号';

  @override
  String get phoneNumber => '电话号码';

  @override
  String get bankAccountNumber => '银行账号';

  @override
  String get passportNumber => '护照号码';

  @override
  String get sensitiveUrls => '敏感网址';

  @override
  String get customExclusionRules => '自定义排除规则';

  @override
  String get customRules => '自定义规则';

  @override
  String get customRulesDesc => '按应用、应用窗口/网站标题、网址或正则表达式模式排除。';

  @override
  String get apps => '应用程序';

  @override
  String get pattern => '模式';

  @override
  String get excludeAnApp => '添加一个新应用程序';

  @override
  String get noCustomAppExcluded => '未排除任何自定义应用程序';

  @override
  String get removeCustomApp => '移除此应用程序';

  @override
  String get excludeUrl => '防止从与这些网址段匹配的网站复制。';

  @override
  String get excludeUrlInputHint => '在此输入网址或部分网址。';

  @override
  String get noCustomUrlExcluded => '未排除任何自定义网址';

  @override
  String get removeCustomUrl => '移除此网址';

  @override
  String get excludePattern => '当复制的内容与这些模式匹配时，防止复制。';

  @override
  String get noCustomPatternExcluded => '未排除任何自定义模式';

  @override
  String get removeCustomPattern => '移除此模式';

  @override
  String get excludeTitle => '当窗口标题匹配时，防止从应用程序或网站复制。';

  @override
  String get noCustomTitleExcluded => '未排除任何自定义标题';

  @override
  String get removeCustomTitle => '移除此标题';

  @override
  String get reconnectGoogleDrive => '⚠️ 重新连接Google Drive？';

  @override
  String get reconnectGoogleDriveDesc =>
      '您的驱动器已经连接！您想重新连接吗？\n\n为了避免数据丢失，请确保使用之前相同的帐户。';

  @override
  String get sureToDeleteItem => '确定删除此项目吗？';

  @override
  String get noAppFoundToHandleFile => '未找到打开此文件的应用程序。';

  @override
  String get fileOpenPermissionNotGranted => '未授予打开此文件的权限。';

  @override
  String get proOnlyTooltip => '此功能仅对Pro用户可用。';

  @override
  String get viewWindow => '窗口模式';

  @override
  String get viewDockRight => '停靠右侧';

  @override
  String get viewDockLeft => '停靠左侧';

  @override
  String get viewDockTop => '停靠顶部';

  @override
  String get viewDockBottom => '停靠底部';

  @override
  String get changeView => '更改视图';

  @override
  String get pin => '固定';

  @override
  String get unpin => '取消固定';

  @override
  String get layoutToGrid => '切换到网格布局';

  @override
  String get layoutToList => '切换到列表布局';

  @override
  String get downloadDesktop => '下载桌面客户端';

  @override
  String get downloadPhone => '下载手机客户端';

  @override
  String get downloadClientDesc => '在所有设备上访问您的剪贴板。';
}
