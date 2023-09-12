import 'dart:convert';

import 'package:demo/model/user.dart';

import 'package:http/http.dart' as http;

Future<List<User>> fetchdata() async {
  final response =
      await http.get(Uri.parse('https://mzcet.in/techquest23/returnjson.php'));
  if (response.statusCode == 200) {
    List<dynamic> jsondata = jsonDecode(response.body);

    List<User> studentData = jsondata
        .map(
          (e) => User.fromJson(e),
        )
        .toList();
    return studentData;
  } else {
    throw Exception('Failed to fetch');
  }
}
