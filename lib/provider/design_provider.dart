import 'dart:convert';

import 'package:example_program1/model/design_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DesignProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<Design> _design = [];
  int _selectedSeason = 1;
  List<Design> get design =>
      _design.where((e) => e.season == _selectedSeason).toList();
  int get selectedSeason => _selectedSeason;

  DesignProvider() {
    fetchDesign();
  }

  Future<void> fetchDesign() async {
    try {
      _isLoading = true;
      notifyListeners();
      final response =
          await http.get(Uri.parse('https://api.tvmaze.com/shows/82/episodes'));

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        _design = data.map((e) => Design.fromJSon(e)).toList();
      }
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectSeason(int season) {
    _selectedSeason = season;
    notifyListeners();
  }
}
