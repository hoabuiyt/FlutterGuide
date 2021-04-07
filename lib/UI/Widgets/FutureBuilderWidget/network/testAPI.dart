import 'dart:async';

import 'package:http/http.dart' as http;

// Test Model to Fetch API
import 'package:FlutterWidgetGuide/UI/Widgets/FutureBuilderWidget/model/test_model.dart';

String url = 'https://jsonplaceholder.typicode.com/posts';

///Method for GET Request
Future<TestFutureBuilderWidget> getResponse() async {
  final response = await http.get('$url/1');
  return responseFromJson(response.body);
}

///Method for POST Request
//Future<http.Response> createResponse(Demo demo) async{
//  final response = await http.post('$url',
//      headers: {
//        HttpHeaders.contentTypeHeader: 'application/json',
//        HttpHeaders.authorizationHeader : ''
//      },
//      body: responseToJson(demo)
//  );
//  return response;
//}