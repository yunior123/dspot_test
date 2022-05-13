import 'package:flutter/material.dart';

import 'image_component.dart';

class PhotoViewer extends StatelessWidget {
  final String imageUrl;
  const PhotoViewer({
    final Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Material(
      color: const Color.fromRGBO(55, 62, 90, 0.9),
      child: Stack(
        children: [
          const Center(
            child: ImageComponent(
              size: Size(300, 300),
              imageUrl: "",
            ),
          ),
          Positioned(
            right: 20,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          )
        ],
      ),
    );
  }
}
