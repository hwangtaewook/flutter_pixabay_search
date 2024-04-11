import 'dart:convert';

import '../../env/env.dart';
import '../dto/photo_result_dto.dart';
import 'package:http/http.dart' as http;

class PhotoDataSource {
  Future<PhotoResultDto> getPhotoResult(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=${Env.apiKey}&q=$query&image_type=photo&pretty=true'));
    return PhotoResultDto.fromJson(jsonDecode(response.body));
  }
}
