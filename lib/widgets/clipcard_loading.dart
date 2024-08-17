import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class ClipcardLoading extends StatelessWidget {
  final bool compact;
  const ClipcardLoading({super.key, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final shimmer = Card.filled(
      margin: EdgeInsets.zero,
      color: colors.surface,
    );
    return GridView.builder(
      padding: compact ? insetLR8BT12 : inset12,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 240,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 15,
      itemBuilder: (context, index) => shimmer,
    );
  }
}
