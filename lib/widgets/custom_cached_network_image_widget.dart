import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CustomCachedNetworkImageWidget extends StatelessWidget {
  final String? image;

  final double? height, width, placeHolderWidth, placeHolderHeight;
  const CustomCachedNetworkImageWidget({
    super.key,
    this.image,
    this.height,
    this.width,
    this.placeHolderHeight,
    this.placeHolderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? '',
      fit: BoxFit.cover,
      width: width,
      height: height,
      placeholder: (context, url) => Center(
        child: SizedBox(
          height: placeHolderHeight,
          width: placeHolderWidth,
          child: const CircularProgressIndicator(
            strokeWidth: 1.5,
            color: primaryColor,
          ),
        ),
      ),
      errorWidget: (context, url, error) =>
          const Icon(Icons.person, color: Colors.grey),
    );
  }
}
