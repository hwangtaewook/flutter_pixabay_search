import 'package:flutter_pixabay_search/data/dto/photo_result_dto.dart';
import 'package:flutter_pixabay_search/domain/model/photo.dart';

extension ToPhoto on Hits {
  Photo toPhoto() {
    return Photo(
      id: id!.toInt(),
      url: previewURL ?? '',
      tags: tags ?? '',
      largeUrl: largeImageURL ?? '',
    );
  }
}
