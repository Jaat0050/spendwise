import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:intl/intl.dart';

class AppCommonFunction {
  //========================snackbar=======================//

  void showSnackbar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: appColors.whiteColor)),
        backgroundColor: appColors.blackColor,
      ),
    );
  }

  //========================error snackbar=======================//

  void showErrorSnackbar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: appColors.whiteColor)),
        backgroundColor: appColors.redColor,
      ),
    );
  }

  //========================green snackbar=======================//

  void showSuccessSnackbar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: appColors.whiteColor)),
        backgroundColor: appColors.greenColor,
      ),
    );
  }

  //=========================currrency==================================//

  static String getCurrency() => '\u20B9';

  String formatCurrency(dynamic value) {
    if (value is double) {
      return _formatDoubleCurrency(value);
    } else if (value is String) {
      return value.trim() == '' ? '0' : _formatDoubleCurrency(double.parse((double.parse(value.toString()).toInt()).toString()));
    }
    return _formatDoubleCurrency(double.parse((double.parse(value.toString()).toInt()).toString()));
  }

  String _formatDoubleCurrency(double value) {
    final formatter = NumberFormat("#", "en_EN");
    return getCurrency() + formatter.format(value);
  }

  //
}

AppCommonFunction appCommonFunction = AppCommonFunction();
