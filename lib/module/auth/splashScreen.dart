import 'package:flutter/material.dart';
import 'package:spendwise_app/aLocalAndRemoteData/local/constant.dart';
import 'package:spendwise_app/data/appAssets.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appMethods.dart';
import 'package:spendwise_app/module/Dashboard.dart';
import 'package:spendwise_app/module/auth/welcomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      constant.isLoggedIn ? AppMethods.navigate(context, const DashboardScreen()) : AppMethods.navigate(context, const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: appColors.greyColor,
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(appAssets.appLogoIcon)),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'SpendWise',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: appColors.blackColor.withOpacity(0.87)),
            ),
            const SizedBox(height: 10),
            Text(
              'Smart Spending, Wise Savings',
              style: TextStyle(fontSize: 16, color: appColors.greyColor),
            ),
          ],
        ),
      ),
    );
  }
}
