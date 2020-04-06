import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String senha) async {
    const url = 'https://carros-springboot.herokuapp.com/api/v2/login';

    Map params = {'username': login, 'password': senha};
    Map<String, String> headers = {'Content-Type': 'application/json'};

    String dados = json.encode(params);

    var response = await http.post(url, body: dados, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return true;
  }
}
