import 'package:flutter/cupertino.dart';
import 'package:flutter_pixabay_search/domain/repository/photo_repository.dart';

import '../../domain/model/photo.dart';
import '../../domain/use_case/get_photo_use_case.dart';

class SearchListViewModel with ChangeNotifier {
  final GetPhotoUseCase _getPhotoUseCase;

  SearchListViewModel({
    required GetPhotoUseCase getPhotoUseCase,
  }) : _getPhotoUseCase = getPhotoUseCase;

  List<Photo> _photos = [];

  List<Photo> get photos => List.unmodifiable(_photos);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void onSearch(String query) async {
    _isLoading = true;
    notifyListeners();

    _photos = await _getPhotoUseCase.excute(query);
    _isLoading = false;
    notifyListeners();
  }
}
