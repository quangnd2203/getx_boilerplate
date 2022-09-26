import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/app_images.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({
    super.key,
    required this.url,
    this.width = 720,
    this.height = 720,
    this.borderRadius = 0,
    this.fit = BoxFit.fitWidth,
  });
  final String url;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;

  static String placeholder({int width = 720, int height = 720, String text = 'No Image'}) => 'https://via.placeholder.com/${width}x${height}.png?text=$text';

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      color: Colors.white,
      imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (BuildContext context, String url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (BuildContext context, String url, dynamic error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            image: AssetImage(AppImages.png('error')),
            fit:  BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
