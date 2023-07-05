import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class Repository {
  final baseUrl = 'https://booking.kai.id/api/stations2';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Model> model = it.map((e) => Model.fromJson(e)).toList();
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
