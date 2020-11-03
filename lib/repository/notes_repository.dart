import 'dart:convert';
import 'package:block_pattern/api/api_provider.dart';
import 'package:block_pattern/model/posts.dart';
import 'package:http/http.dart' as http;

class NotesRepository {
  ApiProvider apiProvider=ApiProvider();

  Future<Posts> getAllPost()=>apiProvider.getAllPost();

}
