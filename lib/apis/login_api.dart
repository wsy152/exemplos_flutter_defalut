import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_experience/class/api_response.dart';
import 'package:project_experience/class/usuario.dart';

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      const url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map params = {'username': login, 'password': senha};
      Map<String, String> headers = {'Content-Type': 'application/json'};

      String dados = json.encode(params);

      var response = await http.post(url, body: dados, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse['error']);
    } catch (error, exception) {
      print('Não foi possivel conectar');
    }
  }
}
