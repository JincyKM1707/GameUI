import 'dart:convert';

import 'package:example_program1/model/design_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DesignProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Design> _design = [];
  List<Design> get design => _design;
  Future<void> fetchDesign() async {
    _isLoading = true;
    notifyListeners();
    final response =
        await http.get(Uri.parse('https://api.tvmaze.com/shows/82/episodes'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      _design = data.map((json) => Design.fromJSon(json)).toList();
    } else {
      _design = [];
    }
    _isLoading = false;
    notifyListeners();
  }
}
