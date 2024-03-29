import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../viewmodel/splash_viewmodel.dart';
import 'home.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Future<bool> data;

  @override
  void initState(){
    SplashScreenViewModel screenViewModel = Provider.of<SplashScreenViewModel>(context, listen: false);
    data = screenViewModel.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    SplashScreenViewModel _screenViewModel = Provider.of<SplashScreenViewModel>(context);
    return Scaffold(
      body: FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is being fetched, show a loading indicator
            return const Center(child: Text("Loading...."));
          } else if (snapshot.hasError) {
            // If an error occurs during data fetching, show an error dialog
            return Center(
              child: AlertDialog(
                title: Text('Error'),
                content: Text('Failed to fetch data.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          } else {
            // If data is fetched successfully, decide whether to navigate to the home screen or show an error dialog
            final shouldNavigateToHome = Provider.of<SplashScreenViewModel>(context).shouldNavigateToHome;

            if (shouldNavigateToHome) {
              // Navigate to the home screen
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              });
            } else {
              // Show an error dialog
              return Center(
                child: AlertDialog(
                  title: Text('Error'),
                  content: Text('Condition not met to navigate to the home screen.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }
          }

          return Container(); // Return an empty container as a fallback
        },
      ),
    );
  }
}
