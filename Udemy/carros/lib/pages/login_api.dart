import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String senha) async {
    var url = 'https://example.com/whatsit/create';

    Map params = {
      'name': 'doodle',
      'color': 'blue',
    };

    var response = await http.post(url, body: params);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return true;
  }
}
