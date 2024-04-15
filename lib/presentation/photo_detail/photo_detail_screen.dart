import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pixabay_search/presentation/serach_list/search_list_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/model/photo.dart';

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;
  const PhotoDetailScreen({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${photo.tags}'),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: photo.id,
              child: Image.network(
                height: 350,
                width: 350,
                photo.largeUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                '${photo.tags}',
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
