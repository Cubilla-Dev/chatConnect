import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchData(
    String apiUrl, dynamic requestBody) async {
  final Uri Url = Uri.http('$apiUrl', '/register');
  print(Url);
  final http.Response response = await http.post(Url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody));

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    //print('La petición se fue $responseData');
    return responseData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}
