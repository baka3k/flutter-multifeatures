import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget(this.photoUrl, {
    super.key,
    this.scaleType = BoxFit.cover,
  });

  final String photoUrl;
  final BoxFit scaleType;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      fit: scaleType,
      imageUrl: photoUrl,
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
