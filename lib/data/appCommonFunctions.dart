import 'package:flutter/material.dart';
import 'package:spendwise_app/aLocalAndRemoteData/local/constant.dart';
import 'package:spendwise_app/aLocalAndRemoteData/local/shared_pref_helper.dart';
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

  //==========================save App Data===============================//

  void saveAppDataFunction() {
    constant.userId = SharedPreferencesHelper.getUserId();
    constant.userName = SharedPreferencesHelper.getUserName();
    constant.userEmail = SharedPreferencesHelper.getUserEmail();
    constant.totalBalance = SharedPreferencesHelper.getTotalBalance();
    constant.numberOfTransaction = SharedPreferencesHelper.getNumberOfTransaction();
    constant.accountCreated = SharedPreferencesHelper.getUserAccountCreated();
    constant.avatarId = SharedPreferencesHelper.getUserAvatarId();
    constant.avatarUrl = SharedPreferencesHelper.getUserAvatarURL();
    constant.userNameFirstLetter = SharedPreferencesHelper.getUserNameFirstLetter();
    constant.isLoggedIn = SharedPreferencesHelper.getIsLoggedIn();
  }

  //==========================delete App Data===============================//

  void deleteAppDataFunction() {
    constant.userId = '';
    constant.userName = '';
    constant.userEmail = '';
    constant.avatarId = '';
    constant.avatarUrl = '';
    constant.accountCreated = '';
    constant.userNameFirstLetter = "";
    constant.isLoggedIn = false;
    constant.totalBalance = 0;
    constant.numberOfTransaction = 0;

    SharedPreferencesHelper.clearShareCache();
  }

  //================================get and save name first initial===================================//

  void getNameInitials() {
    String tempFirstName = constant.userName.trim().split(' ').first;
    String tempFirstNameFirstAlphabet = 'X';
    String nameInatials = 'X';

    if (tempFirstName != '') {
      tempFirstNameFirstAlphabet = tempFirstName.split('').first;
    }
    nameInatials = tempFirstNameFirstAlphabet;
    constant.userNameFirstLetter = nameInatials.toUpperCase();
    SharedPreferencesHelper.setUserNameFirstLetter(letter: nameInatials.toUpperCase());
  }

  //
}

AppCommonFunction appCommonFunction = AppCommonFunction();
