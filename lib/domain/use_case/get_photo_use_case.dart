import 'package:flutter_pixabay_search/domain/model/photo.dart';
import 'package:flutter_pixabay_search/domain/repository/photo_repository.dart';

class GetPhotoUseCase {
  final PhotoRepository _photoRepository;

  const GetPhotoUseCase({
    required PhotoRepository photoRepository,
  }) : _photoRepository = photoRepository;

  Future<List<Photo>> excute(String query) async {
    return (await _photoRepository.getPhotos(query)).take(3).toList();
  }
}
