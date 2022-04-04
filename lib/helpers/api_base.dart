import 'dart:convert';
import 'dart:io';
import 'package:bloc_example/helpers/network_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<dynamic> get(String url) async {
    print('API GET, url $url');

    var responseJson;
    try {
      var fullURL = Uri.parse(_baseUrl + url); 
      final response = await http.get(fullURL);
      responseJson = _returnJson(response);

    } on SocketException {
      print('No Network');
      throw FetchDataException('No Internet connection');
    }

    print('API get received!');

    return responseJson;
  }

  dynamic _returnJson(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      throw FetchDataException(
        'Error ocurred while Communication with Server with StatusCode : ${response.statusCode}'
      );
    }
  }
}