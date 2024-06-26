import 'package:flutter_pixabay_search/data/data_source/photo_data_source.dart';
import 'package:flutter_pixabay_search/data/mapper/photo_mapper.dart';
import 'package:flutter_pixabay_search/domain/model/photo.dart';
import 'package:flutter_pixabay_search/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  const PhotoRepositoryImpl({
    required PhotoDataSource photoDataSource,
  }) : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final dto = await _photoDataSource.getPhotoResult(query);

    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toPhoto()).toList();
  }
}
