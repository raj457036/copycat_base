import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get app__name => 'CopyCat 剪贴板';

  @override
  String get app__slogan => '一个剪贴板，无限可能';

  @override
  String get app__unknown_error => '发生意外错误';

  @override
  String get app__downloading => '下载中...';

  @override
  String get app__download => '下载';

  @override
  String get app__follow_link => '跟随链接';

  @override
  String get app__edit => '编辑';

  @override
  String get app__export => '导出';

  @override
  String get app__delete => '删除';

  @override
  String get app__later => '稍后';

  @override
  String get app__select => '选择';

  @override
  String get app__change => '更改';

  @override
  String get app__confirm => '确认';

  @override
  String get app__action_required => '需要操作';

  @override
  String get app__feature_unavailable => '此功能在您的平台上不可用。';

  @override
  String get app__preview => '预览';

  @override
  String get app__open_file => '打开文件';

  @override
  String get app__change_collection => '更改收藏';

  @override
  String get app__share => '分享';

  @override
  String get app__uploading => '上传中...';

  @override
  String get app__syncing => '同步中...';

  @override
  String get app__sync => '同步';

  @override
  String get app__local => '本地';

  @override
  String get app__send_message => '发送消息';

  @override
  String get app__send_email => '发送邮件';

  @override
  String get app__empty_clipboard => '您的剪贴板是空的。';

  @override
  String get app__load_more => '加载更多';

  @override
  String get app__locale_en => '英语';

  @override
  String get app__locale_es => '西班牙语';

  @override
  String get app__locale_fr => '法语';

  @override
  String get app__locale_de => '德语';

  @override
  String get app__locale_zh => '中文';

  @override
  String get app__language => '语言';

  @override
  String get app__logout => '登出';

  @override
  String get app__no_collection => '未找到收藏';

  @override
  String get app__create_collection => '创建收藏';

  @override
  String get app__pro_tip => '专业提示';

  @override
  String get app__try_again => '重试';

  @override
  String get app__ack__exported => '已导出';

  @override
  String get app__ack__copied => '已复制';

  @override
  String get app__ack__pasted => '已粘贴';

  @override
  String get app__ack__pasting => '粘贴中';

  @override
  String get app__ack__done => '完成';

  @override
  String get app__ack__quit_app => '退出应用';

  @override
  String get app__ack__deleted => '已删除';

  @override
  String get app__ack__deleting => '删除中';

  @override
  String get app__ack__internet_connected => '互联网已连接';

  @override
  String get app__ack__internet_disconnected => '互联网已断开连接';

  @override
  String get app__ack__logout_success => '您已成功退出。';

  @override
  String get app__ack__missing_e2e_setup => '缺少加密设置';

  @override
  String get app__ack__no_app_for_file => '未找到打开此文件的应用程序。';

  @override
  String get app__ack__perm_fail_to_open_file => '未授予打开此文件的权限。';

  @override
  String get dialog__delete_clip__title => '删除剪辑';

  @override
  String dialog__delete_clip__subtitle({required int itemCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      itemCount,
      locale: localeName,
      one: '确定要删除此剪辑吗？',
      other: '确定要删除这些剪辑吗？',
    );
    return '$_temp0';
  }

  @override
  String get dialog__e2e__title => '端到端加密';

  @override
  String get dialog__text__e2e_key_export => '恭喜，您已成功配置端到端加密。';

  @override
  String get dialog__text__e2e_key_export__note =>
      '点击下方按钮导出您的加密密钥。\n将密钥保存在安全地方，以确保您可以在其他设备上设置访问加密信息。';

  @override
  String get dialog__text__e2e_key_generate =>
      '生成加密密钥并妥善存储。此密钥是设置其他设备以访问加密数据所必需的。';

  @override
  String get dialog__button__e2e_generating_key => '生成中';

  @override
  String get dialog__button__e2e_generate_key => '已生成';

  @override
  String get dialog__text__invalid_e2e_key => '导入的密钥无效！';

  @override
  String get dialog__text__e2e_key_import__note => '在下方导入加密密钥，以便在此设备上访问加密数据。';

  @override
  String get dialog__button__e2e_importing_key => '导入中';

  @override
  String get dialog__button__e2e_import_key => '导入';

  @override
  String get dialog__text__inconsistent_time__title => '时间同步警告';

  @override
  String get dialog__text__inconsistent_time__content =>
      '检测到设备时间不一致\n\n为了确保准确的剪贴板同步，请检查并更正您的设备时间设置。\n\n时间设置不一致可能会导致同步问题。';

  @override
  String get dialog__button__try_again => '再次检查';

  @override
  String get dialog__record_keys__title => '记录键盘快捷键';

  @override
  String get dialog__record_keys__subtitle => '使用键盘输入您的快捷键并点击 ';

  @override
  String dialog__delete_collection__title({required Object collectionName}) {
    return '删除 $collectionName';
  }

  @override
  String get dialog__delete_collection__subtitle => '确定要删除此收藏夹吗？';

  @override
  String get dialog__ack__sub_updated => '订阅已更新';

  @override
  String get dialog__grant_entitlement__title => '授予权限';

  @override
  String get dialog__grant_entitlement__subtitle_p1 =>
      '特定个人共享权限码以获得自定义权限。您可以通过';

  @override
  String get dialog__grant_entitlement__subtitle_p2 => '点击这里查看邀请是否仍可用。';

  @override
  String get dialog__grant_entitlement__enter_code => '输入代码并按提交';

  @override
  String get dialog__grant_entitlement__apply_code => '应用';

  @override
  String get view_button__switch_to_grid => '切换到网格布局';

  @override
  String get view_button__switch_to_list => '切换到列表布局';

  @override
  String get view_button__change_view => '更改视图';

  @override
  String get view_button__view_window => '窗口化';

  @override
  String get view_button__view_dock_right => '右侧停靠';

  @override
  String get view_button__view_dock_bottom => '底部停靠';

  @override
  String get view_button__view_dock_left => '左侧停靠';

  @override
  String get view_button__view_dock_top => '顶部停靠';

  @override
  String get view_button__pin => '置顶';

  @override
  String get view_button__unpin => '取消置顶';

  @override
  String get sub_dialog__text__included => '包含';

  @override
  String get sub_dialog__f1__title => '无限剪贴板项目';

  @override
  String get sub_dialog__f1__subtitle => '无限制的剪贴板项目确保您始终可以访问最近的复制内容。';

  @override
  String get sub_dialog__f2__title => '支持所有主要平台';

  @override
  String get sub_dialog__f2__subtitle =>
      '在所有主要平台上无缝同步—Android、iOS、Windows、macOS 和 Linux，实现无缝的生产力。';

  @override
  String get sub_dialog__f3__title => '支持 Apple 通用剪贴板';

  @override
  String get sub_dialog__f3__subtitle =>
      '通过支持 Apple 的通用剪贴板，轻松在 Apple 设备之间传输剪贴板内容。';

  @override
  String get sub_dialog__f4__title => '设备内存储';

  @override
  String get sub_dialog__f4__subtitle =>
      '使用设备内存储保护您的数据，确保您的剪贴板项目始终触手可及，掌握在您手中。';

  @override
  String get sub_dialog__f5__title => 'Google Drive 集成';

  @override
  String get sub_dialog__f5__subtitle =>
      '将文件和媒体安全地存储在 Google Drive 上，便于与 CopyCat 剪贴板无缝集成，增强数据管理。';

  @override
  String get sub_dialog__f6__title => '即时搜索';

  @override
  String get sub_dialog__f6__subtitle => '通过强大的即时搜索功能快速找到所需内容，使剪贴板项目的检索高效且快捷。';

  @override
  String get sub_dialog__f7__title => '最近24小时内的同步';

  @override
  String get sub_dialog__f7__subtitle =>
      '在所有设备上访问和同步您过去 24 小时内的剪贴板历史记录。确保您不会丢失任何重要复制的项目，使您的工作流程无缝和高效。';

  @override
  String get sub_dialog__f8__title => '最多 3 个收藏';

  @override
  String get sub_dialog__f8__subtitle =>
      '将您的剪贴板项目整理到最多 3 个收藏中，从而提供更好的分类以提高工作效率。';

  @override
  String get sub_dialog__f9__title => '每 45 秒自动同步';

  @override
  String get sub_dialog__f9__subtitle => '享受剪贴板项目每 45 秒自动同步，而无需手动干预。';

  @override
  String get sub_dialog__f10__title => '支持端到端加密';

  @override
  String get sub_dialog__f10__subtitle => 'E2EE 将对所有内容进行加密，以实现出色的隐私保护。';

  @override
  String get sub_dialog__text__pro_title => '拥有 PRO ✨';

  @override
  String get sub_dialog__text__pro_subtitle => '免费版包含的所有功能 +';

  @override
  String get sub_dialog__f11__title => '最多 50 个收藏';

  @override
  String get sub_dialog__f11__subtitle => '将您的剪贴板项目整理到最多 50 个收藏中，以实现最佳管理。';

  @override
  String get sub_dialog__f12__title => '最近 30 天的同步';

  @override
  String get sub_dialog__f12__subtitle =>
      '在所有设备上同步您最近30天内复制的剪贴板历史记录。这意味着无论您使用哪个设备，您都可以访问上个月复制的任意剪辑。';

  @override
  String get sub_dialog__f13__title => '实时同步';

  @override
  String get sub_dialog__f13__subtitle => '体验快速的同步效果。';

  @override
  String get sub_dialog__f14__title => '更快、更优先的支持';

  @override
  String get sub_dialog__f14__subtitle => '作为 PRO 用户，获得及时和优先级的支持。';

  @override
  String get sub_dialog__f15__title => '新功能的提前体验';

  @override
  String get sub_dialog__f15__subtitle => '率先尝试新功能和更新。';

  @override
  String get sub_dialog__f16__title => '自定义排除规则';

  @override
  String get sub_dialog__f16__subtitle => '精确控制您的剪贴板。允许您定义复制的内容、复制来源和复制时间。';

  @override
  String get sub_dialog__f17__title => '拖放功能';

  @override
  String get sub_dialog__f17__subtitle => '在桌面和平板设备上无缝移动项目。';

  @override
  String get sub_dialog__f18__title => '主题定制';

  @override
  String get sub_dialog__f18__subtitle => '自定义应用程序的整体外观，以匹配您的偏好。';

  @override
  String get paywall_dialog__text__month => '月';

  @override
  String get paywall_dialog__text__year => '年';

  @override
  String get paywall_dialog__text__subscription => '订阅';

  @override
  String get paywall_dialog__text__supported_platform =>
      '要访问 CopyCat 剪贴板上的高级功能，请通过 Google Play 或 Apple App Store 进行订阅。您的订阅将在所有设备（包括 Linux 和 Windows）上同步。';

  @override
  String get paywall_dialog__text__unlock_pro => '解锁 CopyCat PRO';

  @override
  String get paywall_dialog__text__unlock_pro_p1 =>
      '享受超过 30 天的同步历史记录、超过 50 个收藏、端到端加密、实时同步、新功能访问等。';

  @override
  String get paywall_dialog__text__try_again => '请再试一次';

  @override
  String get paywall_dialog__text__current_plan => '当前方案';

  @override
  String get paywall_dialog__text__expired_plan => '当前方案 • 已过期';

  @override
  String paywall_dialog__text__trial_till({required DateTime till}) {
    final intl.DateFormat tillDateFormat = intl.DateFormat.yMMMd(localeName);
    final String tillString = tillDateFormat.format(till);

    return '试用至 $tillString';
  }

  @override
  String get paywall_dialog__text__upgrade => '升级';

  @override
  String fab__create_collection({required String remaining}) {
    return '创建收藏 (剩余 $remaining)';
  }

  @override
  String get fab__sync => '同步';

  @override
  String get fab__sync_unavailable => '同步不可用';

  @override
  String get fab__sync_up_to_date => '已是最新状态。';

  @override
  String fab__sync_failed({required String message}) {
    return '同步失败：$message';
  }

  @override
  String get layout__navbar__clipboard => '剪贴板';

  @override
  String get layout__navbar__collections => '收藏';

  @override
  String get layout__navbar__settings => '设置';

  @override
  String get search__tooltip__filter => '搜索筛选';

  @override
  String manage_sub__ack__promo_sub({required String till}) {
    return '您正在使用促销订阅，直到 $till';
  }

  @override
  String get manage_sub__button__text => '管理订阅';

  @override
  String get my_account__button__tooltip => '我的账户';

  @override
  String get badges__tooltip__experimental => '此功能为实验性功能，可能无法正常工作。';

  @override
  String get badges__tooltip__pro_only => '此功能仅适用于专业用户。';

  @override
  String get collection_selector__tile__no_collection => '无收藏';

  @override
  String get collection_selector__button__remove_collection => '移除收藏';

  @override
  String get dialog__logout__title => '登出';

  @override
  String get dialog__logout__subtitle =>
      '⚠️ 警告 ⚠️\n\n登出将删除本地数据库中的未同步更改。您确定要继续吗？';

  @override
  String get dialog__logging_out__ack => '正在退出！请稍等...';

  @override
  String get reset_pass__text__label => '重置您的密码';

  @override
  String get dnd__text__drop_here => '拖放到此处';

  @override
  String dnd__ack__error_max_drop_count({required int count}) {
    return '一次最多允许拖放 $count 项。';
  }

  @override
  String get search_filter__text__title => '筛选';

  @override
  String get search_filter__button__apply => '应用';

  @override
  String get search_filter__text__from => '从';

  @override
  String get search_filter__text__select => '选择';

  @override
  String get search_filter__text__to => '到';

  @override
  String get search_filter__text__now => '现在';

  @override
  String get search_filter__text__including => '包括';

  @override
  String get search_filter__chip__text => '文本';

  @override
  String get search_filter__chip__url => '网址';

  @override
  String get search_filter__chip__media => '媒体';

  @override
  String get search_filter__chip__docs => '文档';

  @override
  String get search_filter__text__textCategories => '文本类别';

  @override
  String get search_filter__text__exclusive => '( 专属 )';

  @override
  String get search_filter__text_cat__email => '邮箱';

  @override
  String get search_filter__text_cat__phone => '电话号码';

  @override
  String get search_filter__text_cat__color => '颜色';

  @override
  String get search_filter__text__sort_by => '排序依据';

  @override
  String get search_filter__sort_by__last_mod => '最后修改';

  @override
  String get search_filter__sort_by__created => '创建时间';

  @override
  String get search_filter__sort_by__copy_count => '复制次数';

  @override
  String get search_filter__sort_by__last_copied => '上次复制';

  @override
  String get search_filter__text__sort_order => '排序顺序';

  @override
  String get search_filter__sort_ord__asc => '升序';

  @override
  String get search_filter__sort_ord__desc => '降序';

  @override
  String get login__local_signin__tooltip => '无同步。所有数据都保存在您的设备上。';

  @override
  String get login__local_signin__btn__label => '在本地使用';

  @override
  String get login__form__input__name => '输入您的大名';

  @override
  String get login__form__input__email => '输入您的邮箱';

  @override
  String get login__form__input__error_email => '请输入有效的邮件地址';

  @override
  String get login__form__input__password => '输入您的密码';

  @override
  String get login__form__input__error_password_length => '请输入至少6位长的密码';

  @override
  String get login__form__button__signin => '登录';

  @override
  String get login__form__button__signup => '注册';

  @override
  String get login__form__button__forgot_password => '忘记密码？';

  @override
  String get login__form__text__signup => '还没有账号？注册';

  @override
  String get login__form__text__old_user => '已有账号？登录';

  @override
  String get login__form__text__reset_password => '发送密码重置邮件';

  @override
  String get login__form__text__reset_ack => '密码重置邮件已发送';

  @override
  String get login__form__button__back => '返回登录';

  @override
  String get login__form__button__update_password => '更新密码';

  @override
  String get login__form__text_tnc_p1 => '继续即表示您同意以下 ';

  @override
  String get login__form__text_tnc_p2 => '隐私政策';

  @override
  String get login__form__text_tnc_p3 => ' 和 ';

  @override
  String get login__form__text_tnc_p4 => '服务条款。';

  @override
  String get home__search__hint => '在剪贴板中搜索';

  @override
  String get home__search__reset => '重置搜索';

  @override
  String get preview__vert_view__tab1_title => '预览';

  @override
  String get preview__vert_view__tab2__title => '详细信息';

  @override
  String get preview__card__missing_text => '这是一个空剪辑';

  @override
  String get preview__card__video__play => '播放视频';

  @override
  String get preview__card__file__open => '打开文件';

  @override
  String get preview__form__title => '编辑详情';

  @override
  String get preview__form__input__title => '标题';

  @override
  String get preview__form__input__description => '描述';

  @override
  String get reset_password__appbar__title => '重置您的密码';

  @override
  String get reset_password__success_ack => '密码重置成功';

  @override
  String get onboarding__button__to_login => '登录';

  @override
  String get onboarding__snackbar__export_success => '加密密钥成功导出。';

  @override
  String get onboarding__dialog__skip_export__title => '✋ 备份您的加密密钥';

  @override
  String get onboarding__dialog__skip_export__subtitle =>
      '您还没有导出您的加密密钥。如果没有备份，当密钥丢失或您切换设备时，您将无法访问您的加密剪辑。\n\n👉 如果您已经有密钥的安全备份，可以放心继续。否则，我们强烈建议您现在导出密钥以避免数据丢失。您是否仍希望继续？';

  @override
  String get onboarding__dialog__export_info__title => '🤔 为什么要导出加密密钥？';

  @override
  String get onboarding__dialog__export_info__subtitle =>
      '导出您的加密密钥对于在多个设备上安全访问您的加密数据至关重要。没有密钥，您的加密数据在同步后将无法访问。\n\n在安全位置保留您的加密密钥备份以防止数据丢失。请记住，密钥是您账户的唯一身份标识，若丢失则无法恢复。\n\n注意：CopyCat无法访问您的加密剪辑或加密密钥。因为我们将您的隐私置于首位。';

  @override
  String get onboarding__text__export_key_headline => '剪贴板加密';

  @override
  String get onboarding__text__export_key_title => '💪 好消息！您的剪贴板已激活加密';

  @override
  String get onboarding__button__export_key => '导出密钥';

  @override
  String get onboarding__dialog__skip_gen_key__title => '✋ 您的剪辑将不安全';

  @override
  String get onboarding__dialog__skip_gen_key__subtitle =>
      '您还没有生成加密密钥。没有它，您的剪辑将保持为未加密状态并不安全。您可以稍后在 设置 ❯ 安全 中生成密钥。您是否仍希望继续？';

  @override
  String get onboarding__dialog__gen_key_info__title => '🤔 我为什么需要加密？';

  @override
  String get onboarding__dialog__gen_key_info__subtitle =>
      '加密通过将您的数据转换为仅用密钥才能访问的格式来保护您的数据。没有加密，您的剪辑将以明文存储，使其容易遭受未经授权的访问。启用加密可确保只有您可以访问您的敏感数据，为潜在的数据泄露提供了额外的安全层。';

  @override
  String get onboarding__text__gen_key_headline => '设置剪贴板加密';

  @override
  String onboarding__text__key_generated_title({required String keyPreview}) {
    return '🎉 已成功生成密钥 $keyPreview*** 🎉';
  }

  @override
  String get onboarding__button__regenerate_key => '重新生成密钥';

  @override
  String get onboarding__text__no_key => '您的账户没有任何加密密钥';

  @override
  String get onboarding__button__generate_key => '生成密钥';

  @override
  String get onboarding__button__do_it_later => '稍后再做';

  @override
  String get onboarding__button__why_important => '为什么重要？';

  @override
  String get onboarding__snackbar__invalid_key => '这不是一个有效的 CopyCat 加密密钥';

  @override
  String get onboarding__dialog__skip_import__title => '✋ 加密剪辑不可访问';

  @override
  String get onboarding__dialog__skip_import__subtitle =>
      '您还没有导入加密密钥。这意味着您的所有加密剪辑在同步后将无法在本地访问。\n\n要访问它们，请从 设置 ❯ 安全 中导入密钥。\n您是否仍希望继续？';

  @override
  String get onboarding__dialog__reset_key__title => '✋ 永久删除加密数据';

  @override
  String get onboarding__dialog__reset_key__subtitle =>
      '此操作不可撤销。您确定要从服务器永久删除所有加密数据吗？';

  @override
  String get onboarding__snackbar__reset_key__success => '加密已成功移除。';

  @override
  String get onboarding__dialog__import_info__title => '🤔 我的密钥在哪里？';

  @override
  String get onboarding__dialog__import_info__subtitle =>
      '您的加密密钥是加密设置过程中的一个安全文件。如果您找不到它，请检查您的下载文件夹或您可能保存的任何备份位置。没有这个密钥，您的加密数据将无法访问。\n\n如果您在另一个设备上设置了加密密钥，可以通过转到设置 ❯ 安全 ❯ E2EE 保险箱导出密钥。将密钥安全地传输到此设备以重新获得对您的加密数据的访问权限。';

  @override
  String get onboarding__text__import_key_headline => '导入剪贴板加密密钥';

  @override
  String get onboarding__text__import_key_title => '您的帐户当前已激活加密。';

  @override
  String get onboarding__button__import_key => '导入密钥';

  @override
  String get onboarding__button__reset_key => '重置加密';

  @override
  String get onboarding__button__where_key => '密钥在哪里？';

  @override
  String get onboarding__text__go_home => '回家吧';

  @override
  String onboarding__restoration__failed({required Object message}) {
    return '恢复失败: $message';
  }

  @override
  String get onboarding__restoration_warning =>
      '⚠️ 请在同步过程中保持此页面打开，以避免数据损坏或不一致。';

  @override
  String get restore_clips__text__title => '恢复我的剪贴板';

  @override
  String get restore_clips__error__no_backup => '未找到剪贴板备份';

  @override
  String restore_clips__text__total_count({required num totalCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      totalCount,
      locale: localeName,
      zero: '剪贴板',
      one: '剪贴板',
      other: '剪贴板',
    );
    return '您大约有 $_temp0 需要恢复。';
  }

  @override
  String get restore_clips__sync_disable => '当前未启用同步。请启用同步以继续。';

  @override
  String get restore_clips__preparing => '正在准备恢复剪贴板，请稍候...';

  @override
  String restore_clips__restored({required num syncCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      syncCount,
      locale: localeName,
      zero: '剪贴板',
      one: '剪贴板',
      other: '剪贴板',
    );
    return '您的 $_temp0 已成功恢复。';
  }

  @override
  String restore_clips__restoring(
      {required Object synced, required Object totalCount}) {
    return '已恢复: $synced / $totalCount 个剪贴板。';
  }

  @override
  String get restore_collections__text__title => '恢复我的收藏夹';

  @override
  String get restore_collections__error__no_backup => '未找到收藏夹备份';

  @override
  String restore_collections__text__total_count({required num totalCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      totalCount,
      locale: localeName,
      zero: '收藏夹',
      one: '收藏夹',
      other: '收藏夹',
    );
    return '您大约有 $_temp0 需要恢复。';
  }

  @override
  String get restore_collections__sync_disable => '当前未启用同步。请启用同步以继续。';

  @override
  String get restore_collections__preparing => '正在准备恢复收藏夹，请稍候...';

  @override
  String restore_collections__restored({required num syncCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      syncCount,
      locale: localeName,
      zero: '收藏夹',
      one: '收藏夹',
      other: '收藏夹',
    );
    return '您的 $_temp0 已成功恢复。';
  }

  @override
  String restore_collections__restoring(
      {required Object synced, required Object totalCount}) {
    return '已恢复: $synced / $totalCount 个收藏夹。';
  }

  @override
  String get drive__snackbar__success => '驱动设置已完成。';

  @override
  String get drive__text__setting_up => '设置和同步中...';

  @override
  String get drive__text__setting_up__warning => '请稍候，直到我们完成此步骤。不要关闭应用程序。';

  @override
  String get create_clip__appbar__title__new => '新剪辑';

  @override
  String get create_clip__appbar__title__edit => '编辑剪辑';

  @override
  String get create_clip__button__save_new => '保存为新';

  @override
  String get create_clip__input__hint => '在此处编写您的剪辑内容';

  @override
  String get collections__text__tip => '确保您的重要剪辑在任何时间、任何设备上都可用，将它们保存在收藏夹中！';

  @override
  String get collections__appbar__title => '收藏夹';

  @override
  String get collections__appbar__title__create => '创建收藏';

  @override
  String get collections__appbar__title__edit => '编辑收藏';

  @override
  String get collections__input__name => '名称';

  @override
  String get collections__input__description => '描述';

  @override
  String get select_collection__appbar__title => '选择收藏';

  @override
  String get account__dialog__delete_confirm__title => '账户删除申请';

  @override
  String get account__dialog__delete_confirm__description =>
      '您将被重定向到账户删除申请表，您确定吗？';

  @override
  String get account__list_tile__display_name => '显示名称';

  @override
  String get account__list_tile__email => '邮箱';

  @override
  String get account__list_tile__settings => '账户设置';

  @override
  String get account__list_tile__danger_zone => '危险区域';

  @override
  String get account__button__req_delete => '申请账户删除';

  @override
  String get account__appbar__title => '我的账户';

  @override
  String get settings__appbar__title => '设置';

  @override
  String get settings__tab__1 => '常规';

  @override
  String get settings__tab__2 => '个性化';

  @override
  String get settings__tab__3 => '同步';

  @override
  String get settings__tab__4 => '加密';

  @override
  String get settings__tab__5 => '实验性';

  @override
  String get settings__text__encryption => '加密';

  @override
  String get settings__text__sync_not_available => '使用本地剪贴板时，同步相关配置不可用。';

  @override
  String get settings__appbar__er__title => '排除规则';

  @override
  String get settings__text__er__predefine => '预定义排除规则';

  @override
  String get settings__text__er__pass_manager => '密码管理器';

  @override
  String get settings__text__er__cc => '信用卡号';

  @override
  String get settings__text__er__phone => '电话号码';

  @override
  String get settings__text__er__email => '电子邮件地址';

  @override
  String get settings__text__er__url => '敏感网址';

  @override
  String get settings__text__decrypted__note =>
      '🥳 恭喜！您所有的剪辑已成功在本地解密，\n因此不需要重建数据库。';

  @override
  String get settings__appbar__cer__title => '自定义排除规则';

  @override
  String get settings__switch__drag_n_drop__title => '拖放';

  @override
  String get settings__switch__drag_n_drop__subtitle => '允许项目在应用内自由双向移动。';

  @override
  String get settings__dropdown__no_copy_over_limit__title => '不自动复制超过';

  @override
  String settings__dropdown__no_copy_over_limit__subtitle(
      {required String fileSize}) {
    return '超过一定大小($fileSize)的文件和媒体不会自动复制。';
  }

  @override
  String get settings__text__5MB => '5 MB';

  @override
  String get settings__text__10MB => '10 MB';

  @override
  String get settings__text__20MB => '20 MB';

  @override
  String get settings__text__50MB => '50 MB';

  @override
  String get settings__text__100MB => '100 MB';

  @override
  String get settings__dropdown__no_upload_over_limit__title => '不自动上传超过';

  @override
  String settings__dropdown__no_upload_over_limit__subtitle(
      {required String fileSize}) {
    return '超过一定大小($fileSize)的文件和媒体不会自动上传。';
  }

  @override
  String get settings__dropdown__sync_mode__title => '同步模式';

  @override
  String get settings__dropdown__sync_mode__subtitle => '选择最适合您的同步速度。';

  @override
  String get settings__sync_mode__realtime => '实时';

  @override
  String get settings__sync_mode__balanced => '平衡';

  @override
  String get settings__dropdown__theme__title => '主题模式';

  @override
  String get settings__theme__system => '系统';

  @override
  String get settings__theme__light => '浅色';

  @override
  String get settings__theme__dark => '深色';

  @override
  String get settings__dropdown__color_mode__title => '颜色模式';

  @override
  String get settings__dropdown__color_mode__subtitle =>
      '选择颜色模式以自定义应用程序的外观。默认选项为“色调点”。';

  @override
  String get settings__color_mode__tonalSpot => '色调点';

  @override
  String get settings__color_mode__content => '内容';

  @override
  String get settings__color_mode__expressive => '表现力';

  @override
  String get settings__color_mode__fidelity => '保真';

  @override
  String get settings__color_mode__fruit_salad => '水果沙拉';

  @override
  String get settings__color_mode__monochrome => '单色';

  @override
  String get settings__color_mode__neutral => '中性';

  @override
  String get settings__color_mode__rainbow => '彩虹';

  @override
  String get settings__color_mode__vibrant => '活力';

  @override
  String get settings__tile__cer_title => '自定义规则';

  @override
  String get settings__tile__cer_subtitle => '根据应用、应用窗口/网站标题、网站网址或正则表达式模式排除';

  @override
  String get settings__tile__er_title => '排除规则';

  @override
  String get settings__tile__er_subtitle => '防止信息复制到剪贴板。点击以获得高级控制。';

  @override
  String get settings__switch__enable_sync__title => '剪贴板同步';

  @override
  String get settings__switch__enable_sync__subtitle => '无缝地同步您的剪贴板到其他设备。';

  @override
  String get settings__switch__sync_file__title => '文件和媒体同步';

  @override
  String get settings__switch__sync_file__subtitle => '切换以在设备间同步文件和媒体剪辑。';

  @override
  String get settings__switch__paused__title => '暂停剪贴板监听';

  @override
  String get settings__switch__paused__subtitle => '暂时暂停剪贴板跟踪直到设置的时间。';

  @override
  String settings__switch__paused_active__subtitle({required Object time}) {
    return '暂停到 $time 。轻触以恢复或调整时间。';
  }

  @override
  String get settings__switch__smart_paste__title => '智能粘贴';

  @override
  String get settings__switch__smart_paste__subtitle => '直接在目标应用上粘贴内容。';

  @override
  String get settings__switch__startup__title => '启动时运行';

  @override
  String get settings__switch__startup__subtitle => '设备启动时自动启动 CopyCat。';

  @override
  String get settings__switch__hotkey__title => '用快捷键切换';

  @override
  String get settings__switch__hotkey__subtitle => '使用键盘快捷键快速访问 CopyCat 剪贴板';

  @override
  String get settings__hotkey__unassigned => '未分配';

  @override
  String get settings__hotkey__preview_start => '按 ';

  @override
  String get settings__hotkey__preview_end => ' 来显示或隐藏应用。';

  @override
  String get settings__tile__theme_color__title => '主题颜色';

  @override
  String get settings__tile__theme_color__subtitle => '此颜色将影响应用程序的整体外观。';

  @override
  String get settings__tile__desk_client__title => '下载桌面客户端';

  @override
  String get settings__tile__mobile_client__title => '下载手机客户端';

  @override
  String get settings__tile__client__subtitle => '在所有设备上访问您的剪贴板。';

  @override
  String get settings__tile__e2e_setup__title => '端到端加密设置';

  @override
  String get settings__tile__e2e_setup__subtitle => '配置您的剪贴板加密。';

  @override
  String get settings__switch__e2e__title => '启用加密';

  @override
  String get settings__switch__e2e__subtitle => '切换以激活或停用您的剪贴板的端到端加密。';

  @override
  String get settings__dialog__conn_gdrive__title => '重新连接 Google Drive?';

  @override
  String get settings__dialog__conn_gdrive__subtitle =>
      '您的 Google Drive 已连接！您想重新连接？\n\n为避免任何数据丢失，请确保使用之前的相同帐户。';

  @override
  String get settings__drive__connected => '已连接';

  @override
  String get settings__drive__loading => '载入中...';

  @override
  String get settings__drive__authorizing => '授权中...';

  @override
  String get settings__drive__disconnected => '已断开连接';

  @override
  String get settings__text__cloud__title => '云端驱动';

  @override
  String get settings__text__cloud__name => 'Google Drive';

  @override
  String get settings__text__gdrive__error => 'Google Drive 未连接。文件和媒体同步目前已停用。';

  @override
  String get settings__text__gdrive__info =>
      '您的文件和媒体通过 Google Drive 安全地跨设备同步，确保您的隐私得到保护。';

  @override
  String get settings__tile__other_cloud__title => '设置其他云端驱动';

  @override
  String get settings__tile__other_cloud__subtitle =>
      '设置其他云驱动，如 Dropbox, OneDrive 等。';

  @override
  String get custom_er__nav__1 => '应用';

  @override
  String get custom_er__nav__2 => '窗口标题';

  @override
  String get custom_er__nav__3 => '网址';

  @override
  String get custom_er__nav__4 => '文本模式';

  @override
  String get custom_er__text__not_supported => '此排除尚不支持';

  @override
  String get custom_er__tile__add_app => '添加一个应用程序';

  @override
  String get custom_er__text__no_app => '尚无自定义排除的应用';

  @override
  String get custom_er__button__remove_app => '移除此应用';

  @override
  String get custom_er__tile__pattern => '当复制的内容符合这些模式时禁止复制';

  @override
  String get custom_er__text__no_pattern => '尚无自定义排除模式';

  @override
  String get custom_er__button__remove_pattern => '移除此模式';

  @override
  String get custom_er__tile__url => '禁止从符合这些网址段的网页复制。';

  @override
  String get custom_er__input__url_hint => '输入一个网址或网址的一部分。';

  @override
  String get custom_er__text__no_url => '尚无自定义排除网址';

  @override
  String get custom_er__button__remove_url => '移除此网址';

  @override
  String get custom_er__tile__title => '当窗口标题匹配时禁止从应用或网站复制。';

  @override
  String get custom_er__text__no_title => '尚无自定义排除标题';

  @override
  String get custom_er__button__remove_title => '移除此标题';
}
