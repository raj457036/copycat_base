import 'package:any_link_preview/any_link_preview.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class LinkPreview extends StatelessWidget {
  final String url;
  final bool expanded;
  const LinkPreview({
    super.key,
    required this.url,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final isValidUrl = AnyLinkPreview.isValidLink(url);
    if (!isValidUrl) {
      return SizedBox.shrink();
    }
    final placeholder = Card.filled(
      child: Center(child: CircularProgressIndicator()),
    );
    return AnyLinkPreview.builder(
        link: url,
        placeholderWidget:
            expanded ? Expanded(child: placeholder) : placeholder,
        errorWidget: SizedBox.shrink(),
        cache: Duration(days: 30),
        itemBuilder: (context, meta, provider, svg) {
          if (meta.title == null && meta.desc == null && provider == null) {
            return const SizedBox.shrink();
          }
          final colors = context.colors;
          final content = Card.filled(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: radius8,
            ),
            child: ClipRRect(
              borderRadius: radius8,
              child: Column(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (provider != null)
                    Expanded(
                      child: Image(
                          image: provider,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const SizedBox.shrink()),
                    )
                  else if (svg != null)
                    Expanded(child: svg),
                  if (meta.title != null || meta.desc != null)
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(padding4),
                        child: Column(
                          spacing: 4,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (meta.title != null && meta.title!.isNotEmpty)
                              Flexible(
                                child: Text(
                                  meta.title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    // color: colors.primary,
                                  ),
                                ),
                              ),
                            if (meta.desc != null && meta.desc!.isNotEmpty)
                              Flexible(
                                child: Text(
                                  meta.desc!,
                                  overflow: TextOverflow.fade,
                                  maxLines: 4,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: colors.outline,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          );
          if (expanded) return Expanded(child: content);
          return content;
        });
  }
}
