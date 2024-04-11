import 'package:flutter_pixabay_search/data/dto/photo_dto.dart';
import 'package:flutter_pixabay_search/data/model/photo.dart';

extension ToPhoto on Hits {
  Photo toPhoto() {
    return Photo(
      id: id!.toInt(),
      url: previewURL ?? '',
      tags: tags ?? '',
    );
  }
}
