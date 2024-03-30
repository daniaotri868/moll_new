import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.radius,
    this.isCircle = false,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String imageUrl;
  final BoxFit fit;
  final bool isCircle;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(shape: isCircle ? BoxShape.circle : BoxShape.rectangle, borderRadius: radius == null ? null : BorderRadius.circular(radius!)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        filterQuality: FilterQuality.high,
        placeholder: (context, url) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.flutter_dash),
        fit: fit,
      ),
    );
  }
}
