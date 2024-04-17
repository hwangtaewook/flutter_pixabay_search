import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pixabay_search/domain/model/photo.dart';
import 'package:flutter_pixabay_search/presentation/photo_detail/photo_detail_screen.dart';
import 'package:flutter_pixabay_search/presentation/serach_list/components/image_card.dart';
import 'package:flutter_pixabay_search/presentation/serach_list/search_list_view_model.dart';
import 'package:provider/provider.dart';

class SearchListScreen extends StatefulWidget {
  const SearchListScreen({super.key});

  @override
  State<SearchListScreen> createState() => _SearchListScreenState();
}

class _SearchListScreenState extends State<SearchListScreen> {
  final _queryTextEditingController = TextEditingController();

  @override
  void dispose() {
    _queryTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchListViewModel>();
    // final _photos = [
    //   Photo(
    //     id: 1,
    //     url:
    //         'https://image.fmkorea.com/files/attach/new3/20240312/4366334379/6784961595/6810693271/527c35620fcc82627df90519163b3890.jpg',
    //     tags: 'tags',
    //   ),
    //   Photo(
    //     id: 1,
    //     url:
    //         'https://image.fmkorea.com/files/attach/new3/20240312/4366334379/6784961595/6810693271/527c35620fcc82627df90519163b3890.jpg',
    //     tags: 'tags',
    //   ),
    //   Photo(
    //     id: 1,
    //     url:
    //         'https://image.fmkorea.com/files/attach/new3/20240312/4366334379/6784961595/6810693271/527c35620fcc82627df90519163b3890.jpg',
    //     tags: 'tags',
    //   )
    // ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _queryTextEditingController,
            onSubmitted: (value) {
              final query = _queryTextEditingController.text;
              viewModel.onSearch(query);
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: '검색어',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  final query = _queryTextEditingController.text;
                  viewModel.onSearch(query);
                  print(query);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: viewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      children:
                          // _photos.map((e) => Image.network(e.url)).toList(),
                          viewModel.photos
                              .map((e) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PhotoDetailScreen(photo: e),
                                        ),
                                      );
                                    },
                                    child: ImageCard(photo: e),
                                  ))
                              .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
