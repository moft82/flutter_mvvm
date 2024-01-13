import 'package:flutter/material.dart';

class SplashScreenViewModel extends ChangeNotifier {
  bool shouldNavigateToHome = false;

  Future<void> fetchData() async {
    // Simulate fetching data
    await Future.delayed(Duration(seconds: 2));

    // Replace this condition with your own logic
    shouldNavigateToHome = true;

    notifyListeners();
  }
}
