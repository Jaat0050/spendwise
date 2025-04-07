import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spendwise_app/aLocalAndRemoteData/local/shared_pref_helper.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appCommonFunctions.dart';
import 'package:spendwise_app/module/auth/splashScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  runZonedGuarded(() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await SharedPreferencesHelper.init();

      await Supabase.initialize(
        url: 'https://puknulhbifrxlxqjlmta.supabase.co',
        anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB1a251bGhiaWZyeGx4cWpsbXRhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE0NzA2MDAsImV4cCI6MjA1NzA0NjYwMH0.wjY-M9IA3X1TWQyjlD5NahbJ85IKTxqqx40xciA1aPU',
      );

      appCommonFunction.saveAppDataFunction();

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
      home: const SplashScreen(),
    );
  }
}
