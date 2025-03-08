import 'dart:async';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/module/auth/splashScreen.dart';

void main() {
  runZonedGuarded(() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      runApp(const MyApp());
    } catch (e) {
      print('--------------------------error');
      print(e.toString());
      print('00000000000000000000000000000000');
    }
  }, (error, stack) {
    print('===================================ERROR');
    print(error);
    print('===================================stack');
    print(stack);
    print('==============================');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spend Wise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: appColors.primaryColor),
        primaryColor: appColors.primaryColor,
        useMaterial3: false,
      ),
      home: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            backgroundColor: appColors.blackColor,
            behavior: SnackBarBehavior.fixed,
            duration: const Duration(seconds: 2),
            showCloseIcon: true,
            closeIconColor: appColors.whiteColor,
            content: const Text('Double tap to exit app', textAlign: TextAlign.left),
          ),
          child: const SplashScreen(),
        ),
      ),
    );
  }
}
