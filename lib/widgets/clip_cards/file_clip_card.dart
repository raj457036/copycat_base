import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';

class FileClipCard extends StatelessWidget {
  final ClipboardItem item;

  const FileClipCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    final label = "${item.fileMimeType!} • ${formatBytes(item.fileSize!)}";

    final metaChip = Chip(
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      // side: BorderSide.none,
    );

    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(padding8),
        child: Stack(
          children: [
            Text(
              item.fileName?.sub(end: 25) ?? "No Name",
              overflow: TextOverflow.fade,
              maxLines: 5,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(
                color: colors.onSurface,
                height: 1.8,
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.95),
              child: metaChip,
            ),
          ],
        ),
      ),
    );
  }
}
