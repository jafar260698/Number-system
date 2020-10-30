
import 'package:http/http.dart' as http;

const baseUrl = "http://www.jafartemirov.uz";
class API {
  static Future getUsers() {
    var url = baseUrl + "/android/admin_notes.php";
    return http.get(url);
  }
}