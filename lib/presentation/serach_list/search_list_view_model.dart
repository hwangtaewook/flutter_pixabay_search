import 'package:flutter/cupertino.dart';
import 'package:flutter_pixabay_search/domain/repository/photo_repository.dart';

import '../../domain/model/photo.dart';

class SearchListViewModel with ChangeNotifier {
  final PhotoRepository _photoRepository;

  SearchListViewModel({
    required PhotoRepository photoRepository,
  }) : _photoRepository = photoRepository;

  List<Photo> _photos = [];

  List<Photo> get photos => List.unmodifiable(_photos);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void onSearch(String query) async {
    _isLoading = true;
    notifyListeners();

    _photos = await _photoRepository.getPhotos(query);
    _isLoading = false;
    notifyListeners();
  }
}
