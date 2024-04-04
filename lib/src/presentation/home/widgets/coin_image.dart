import 'package:flutter/material.dart'
    show
        BuildContext,
        EdgeInsets,
        FlutterLogo,
        Image,
        NetworkImage,
        Padding,
        ResizeImage,
        StatelessWidget,
        Widget;

/// Todo: Add default image.
class CoinImage extends StatelessWidget {
  final String? imageUrl;
  final double height;
  final double width;
  const CoinImage({
    super.key,
    this.imageUrl,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    String url = '';
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      url = imageUrl!;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: url.isNotEmpty
          ? Image(
              image: ResizeImage(
                NetworkImage(url),
                height: height.toInt(),
                width: width.toInt(),
              ),
              height: height,
              width: width,
            )
          : FlutterLogo(size: height),
    );
  }
}
