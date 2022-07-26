import 'dart:convert';
import 'package:http/http.dart' as http;
import '../variables.dart';

extension IsOk on http.StreamedResponse {
  bool get ok {
    return (statusCode ~/ 100) == 2;
  }
}


Future<List> getRequest(String path, Map<String, dynamic>?parameters) async {
  List JSONList = [];
  String requestURL = "$APIPath/$path/?";
  if(parameters != null){
    for (String key in parameters.keys) {
      requestURL += "$key=${parameters[key].toString()}&";
    }
  }

  requestURL = requestURL.substring(0, requestURL.length - 1);
  final request = http.Request("GET", Uri.parse(requestURL));
  request.headers.addAll(<String, String>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  });
  try {
    final response = await request.send();
    JSONList = json.decode(await response.stream.bytesToString());
  } catch(e) {
    print("error:\n$requestURL\n${parameters.toString()}\n${e.toString()}");
  }
  return JSONList;
}

Future<bool> postRequest(String path, Map<String, dynamic> parameters) async {
  final request = http.Request("POST", Uri.parse("$APIPath/$path/"));
  request.headers.addAll(<String, String>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  });
  request.body = const JsonEncoder().convert(parameters);
  final response = await request.send();
  if(!response.ok){
    print(await response.stream.bytesToString());
  }
  return response.ok;
}

Future<bool> deleteRequest(String path, Map<String, dynamic>?parameters) async {
  String requestURL = "$APIPath/$path/?";
  if(parameters != null){
    for (String key in parameters.keys) {
      requestURL += "$key=${parameters[key].toString()}&";
    }
  }

  requestURL = requestURL.substring(0, requestURL.length - 1);
  final request = http.Request("DELETE", Uri.parse(requestURL));
  request.headers.addAll(<String, String>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  });
  try {
    final response = await request.send();
    return response.ok;
  } catch(e) {
    print("error:\n/$path\n${parameters.toString()}\n${e.toString()}");
  }
  return false;
}