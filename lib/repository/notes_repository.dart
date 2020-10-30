import 'dart:convert';
import 'package:block_pattern/model/Notes.dart';
import 'package:http/http.dart' as http;

abstract class ArticleRepository {
  Future<List<Notes>> getArticles();
}

class ArticleRepositoryImpl implements ArticleRepository{
  final _httpClient = http.Client();
  final URL="https://jsonplaceholder.typicode.com/posts";

  @override
  Future<List<Notes>> getArticles() async{
    final response = await _httpClient.get(URL);
    if (response.statusCode != 200) throw http.ClientException('Failed to load data');

    print("response: ${json.decode(response.body)}");
    return List<Notes>.from(json.decode(response.body));
  }

}