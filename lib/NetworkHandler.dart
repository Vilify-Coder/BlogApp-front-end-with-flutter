import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

var logger = Logger();

class NetworkHandler {
  String baseurl = "http://192.168.43.64:5000";
  FlutterSecureStorage storage = FlutterSecureStorage();
  Future get(String url) async {
    String token = await storage.read(key: "token");
    url = formatter(url);
    var response =
        await http.get(url, headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200 || response.statusCode == 200) {
      logger.i(response.body);
      return json.decode(response.body);
    }
    logger.i(response.statusCode);
    logger.i(response.body);
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    String token = await storage.read(key: "token");
    url = formatter(url);
    var response = await http.post(url,
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode(body));
    logger.i(response.statusCode);
    logger.i(response.body);
    return response;
  }

  Future<http.StreamedResponse> patchImage(String url, String filepath) async {
    url = formatter(url);
    String token = await storage.read(key: "token");
    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath("img", filepath));
    request.headers.addAll({
      "content-type": "multipart/form-data",
      "Authorization": "Bearer $token"
    });
    var response = request.send();
    return response;
  }

  String formatter(String url) {
    return baseurl + url;
  }
}
