import 'dart:convert';
import 'package:block_pattern/model/posts.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();
  final baseUrl = "http://www.jafartemirov.uz/android/admin_notes.php";

   Future<Posts> getAllPost() async{
       final response=await client.get(baseUrl);
       if(response.statusCode==200){
         print("Response: "+response.body);
         return Posts.fromJson(json.decode(response.body));
       }else{
         throw Exception('Failed to get data');
       }
   }

}