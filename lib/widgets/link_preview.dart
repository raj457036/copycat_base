import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/widgets.dart';

class LinkPreview extends StatelessWidget {
  final String url;
  const LinkPreview({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final isValidUrl = AnyLinkPreview.isValidLink(url);
    if (!isValidUrl) {
      return SizedBox.shrink();
    }
    return AnyLinkPreview.builder(
      link: url,
      itemBuilder: (context, meta, provider, svg) {
        return Row(
          children: [
            if (provider != null) Image(image: provider),
            Expanded(
              child: Column(
                children: [
                  if (meta.title != null) Text(meta.title!),
                  if (meta.desc != null) Text(meta.desc!),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
