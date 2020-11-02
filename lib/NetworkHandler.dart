import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import 'package:http/http.dart' as http;

var logger = Logger();

class NetworkHandler {
  String baseurl = "https://fierce-savannah-19106.herokuapp.com";

  Future get(String url) async {
    //user/register
    url = formatter(url);
    var response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(url);
      logger.i(response.body);
      logger.i(response.statusCode);
      return json.decode(response.body);
    }

    logger.i(response.body);
    logger.i(response.statusCode);
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    url = formatter(url);
    var response = await http.post(url,
        headers: {"content-type": "application/json"}, body: json.encode(body));
    return response;
  }

  String formatter(String url) {
    return baseurl + url;
  }
}
