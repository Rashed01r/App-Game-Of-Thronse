import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class WebService {
  Future<List<dynamic>?> getCharacters() async {
    const url = 'https://thronesapi.com/api/v2/Characters';

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        print("Check the status");
      }
    } on FormatException {
      print("json error");
    } on SocketException {
      print("there is no Internet");
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
