import 'package:flutter/cupertino.dart';
import 'package:flutter_pixabay_search/domain/repository/photo_repository.dart';
import 'package:flutter_pixabay_search/presentation/serach_list/search_list_state.dart';

import '../../domain/model/photo.dart';
import '../../domain/use_case/get_photo_use_case.dart';

class SearchListViewModel with ChangeNotifier {
  final GetPhotoUseCase _getPhotoUseCase;

  SearchListViewModel({
    required GetPhotoUseCase getPhotoUseCase,
  }) : _getPhotoUseCase = getPhotoUseCase;

  SearchListState _state = const SearchListState();

  SearchListState get state => _state;

  void onSearch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    _state = state.copyWith(
      photos: await _getPhotoUseCase.excute(query),
      isLoading: false,
    );
    notifyListeners();
  }
}
