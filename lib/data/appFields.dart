import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appColors.dart';

class AppFields {
  InputDecoration buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: appColors.whiteColor.withOpacity(0.7)),
      prefixIcon: Icon(icon, color: appColors.whiteColor.withOpacity(0.7)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: appColors.whiteColor.withOpacity(0.54))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: appColors.whiteColor)),
    );
  }

  InputDecoration buildPasswordInputDecoration(String label, IconData icon, VoidCallback toggleVisibility, bool isVisible) {
    return buildInputDecoration(label, icon).copyWith(
      suffixIcon: IconButton(
        icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off, color: appColors.whiteColor.withOpacity(0.7)),
        onPressed: toggleVisibility,
      ),
    );
  }
}

AppFields appFields = AppFields();
