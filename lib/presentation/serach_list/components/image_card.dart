import 'package:flutter/material.dart';

import '../../../data/model/photo.dart';

class ImageCard extends StatelessWidget {
  final Photo photo;

  const ImageCard({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: photo.id,
      child: Image.network(
        photo.url,
        fit: BoxFit.cover,
      ),
    );
  }
}
