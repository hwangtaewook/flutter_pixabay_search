import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pixabay_search/data/model/photo.dart';
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
        title: Text('이미지 검색'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '검색어',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  final query = _queryTextEditingController.text;
                  viewModel.onSearching(query);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children:
                    // _photos.map((e) => Image.network(e.url)).toList(),
                    viewModel.photos
                        .map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              e.url,
                              fit: BoxFit.cover,
                            )))
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
