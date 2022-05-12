import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final String imageUrl;
  final Size? size;
  const ImageComponent({
    Key? key,
    required this.imageUrl,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO check why image has error
    return SizedBox(
      width: size?.width ?? 60,
      height: size?.height ?? 60,
      child: CachedNetworkImage(
        imageUrl: "https://mdbcdn.b-cdn.net/img/new/avatars/2.webp",
      ),
    );
  }
}
