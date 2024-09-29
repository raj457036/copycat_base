import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayoutBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, AppLayout layout, bool supported)
      builder;

  const AppLayoutBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppConfigCubit, AppConfigState, AppLayout>(
      selector: (state) {
        return state.config.layout;
      },
      builder: (context, layout) {
        final width = context.mq.size.width;
        if (width > dockedLRMaxWidth && !isMobilePlatform) {
          return builder(context, AppLayout.grid, false);
        }
        return builder(context, layout, true);
      },
    );
  }
}
