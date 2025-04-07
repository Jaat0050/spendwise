import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appAssets.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appGradients.dart';
import 'package:spendwise_app/data/appMethods.dart';
import 'package:spendwise_app/module/auth/loginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(gradient: appGradient.blueGreyWhiteGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Container(
              //     width: 100,
              //     height: 100,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: appColors.whiteColor.withOpacity(0.2),
              //       image: DecorationImage(image: AssetImage(appAssets.appLogoIcon)),
              //     ),
              //   ),
              // ),
              const Spacer(),

              // Placeholder for Animation or Image

              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  color: appColors.whiteColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage(appAssets.appLogoIcon)),
                ),
              ),
              const Spacer(),

              // Welcome Text

              Column(
                children: [
                  Text(
                    "Welcome to",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: appColors.whiteColor),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "SpendWise",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: appColors.whiteColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "The best way to track your expenses.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: appColors.whiteColor.withOpacity(0.7)),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Next Button

              GestureDetector(
                onTap: () {
                  AppMethods.navigate(context, const LoginScreen());
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: appColors.whiteColor),
                  child: Icon(Icons.arrow_forward_ios, color: appColors.blackColor, size: 30),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
