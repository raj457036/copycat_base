import 'package:animate_do/animate_do.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class ImageNotFound extends StatelessWidget {
  const ImageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 40 || constraints.maxHeight < 35) {
        return const SizedBox.shrink();
      }
      if (constraints.maxWidth < 60 || constraints.maxHeight < 60) {
        return FadeIn(
          child: Icon(
            Icons.image_not_supported_rounded,
            color: colors.outline,
          ),
        );
      }
      return FadeIn(
        child: Card.filled(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(padding4),
            child: Column(
              spacing: 6,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_not_supported_rounded,
                  color: colors.outline,
                ),
                Text(
                  "Image not found",
                  style: TextStyle(
                    color: colors.outline,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
