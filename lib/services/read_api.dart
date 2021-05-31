import 'dart:convert';

import 'package:api_test/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserRead {


  //TODO :: METHOD REDA API

  Future<String> getUsersData() async {
    final response =
    await http.get("https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //print(response.body);
      final data =response.body;
     return data;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


}