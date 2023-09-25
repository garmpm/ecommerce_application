import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_application/src/aux/firebase_constants.dart';
import 'package:ecommerce_application/src/models/restaurant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  int rezervationCount = 0;
  var favorites = <Restaurant>[];

  Future<void> init() async {
    //await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform);

    auth.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
      } else {
        _loggedIn = false;
      }
      notifyListeners();
    });
  }

  RestaurantModel parseRestaurants(String responseBody) {
    final parsed = jsonDecode(responseBody);

    return RestaurantModel.fromJson(parsed);
  }

  Future<RestaurantModel> initModel() async {
    final String json =
        await rootBundle.loadString('assets/samples/restaurant.json');
    return parseRestaurants(json);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  void toggleFavorite(index) {
    if (favorites.contains(index)) {
      favorites.remove(index);
    } else {
      favorites.add(index);
    }
    if (kDebugMode) {
      print(favorites);
    }
    notifyListeners();
  }

  void incrementCount() {
    rezervationCount++;
    notifyListeners();
  }

  void decrementCount() {
    rezervationCount--;
    notifyListeners();
  }
}
