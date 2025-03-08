import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appColors.dart';

class AppButtons {
  Widget whiteFullWidthButton(String buttonText, onpressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: appColors.whiteColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(buttonText, style: TextStyle(fontSize: 18, color: appColors.blackColor)),
      ),
    );
  }
}

AppButtons appButton = AppButtons();
