import 'package:idobloodapp/model/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUser() async {
  String url="https://idobloodadmin.000webhostapp.com/consultprofile.php";
  final response = await http.get(url);
  return userFromJson(response.body);

}