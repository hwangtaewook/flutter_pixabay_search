import 'package:flutter/material.dart';
import 'package:flutter_pixabay_search/data/data_source/photo_data_source.dart';
import 'package:flutter_pixabay_search/data/repository/photo_respository_impl.dart';
import 'package:flutter_pixabay_search/domain/use_case/get_photo_use_case.dart';
import 'package:flutter_pixabay_search/presentation/serach_list/search_list_view_model.dart';
import 'package:provider/provider.dart';

import 'presentation/serach_list/search_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => SearchListViewModel(
          getPhotoUseCase: GetPhotoUseCase(
            photoRepository: PhotoRepositoryImpl(
              photoDataSource: PhotoDataSource(),
            ),
          ),
        ),
        child: const SearchListScreen(),
      ),
    );
  }
}
