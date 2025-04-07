import 'package:flutter/material.dart';
import 'package:spendwise_app/aLocalAndRemoteData/local/constant.dart';
import 'package:spendwise_app/aLocalAndRemoteData/local/shared_pref_helper.dart';
import 'package:spendwise_app/aLocalAndRemoteData/remote/supaBaseFunctions.dart';
import 'package:spendwise_app/data/appCommonFunctions.dart';
import 'package:spendwise_app/models/userDataModel.dart';

class GetUserData {
  Future<dynamic> getUserData(BuildContext context) async {
    try {
      dynamic userData = await supabaseFunctions.getUserData(context);

      if (userData != null) {
        UserDataModel data = UserDataModel.fromMap(userData);

        SharedPreferencesHelper.setUserId(id: data.id ?? '');
        SharedPreferencesHelper.setUserName(name: data.name ?? '');
        SharedPreferencesHelper.setUserEmail(email: data.email ?? '');
        SharedPreferencesHelper.setTotalBalance(total: data.totalBalance ?? 0);
        SharedPreferencesHelper.setNumberOfTransaction(transactions: data.numberOfTransaction ?? 0);
        SharedPreferencesHelper.setUserAccountCreated(date: data.created ?? '');
        SharedPreferencesHelper.setUserAvatarId(id: data.avatarId ?? '');
        SharedPreferencesHelper.setUserAvatarURL(url: data.avatarUrl ?? '');
        SharedPreferencesHelper.setIsLoggedIn(loggedIn: true);

        constant.userId = data.id ?? '';
        constant.userName = data.name ?? '';
        constant.userEmail = data.email ?? '';
        constant.totalBalance = data.totalBalance ?? 0;
        constant.numberOfTransaction = data.numberOfTransaction ?? 0;
        constant.accountCreated = data.created ?? '';
        constant.avatarId = data.avatarId ?? '';
        constant.avatarUrl = data.avatarUrl ?? '';
        constant.isLoggedIn = true;

        printSaveData();
        appCommonFunction.getNameInitials();
      } else {
        appCommonFunction.showErrorSnackbar(message: 'Something went wrong plzz login again', context: context);
      }
    } catch (e) {
      print('--------------------------USER DATA ERROR--------------------------');
      print(e.toString());
    }
  }

  printSaveData() {
    print('----------------------------START---------------------------------------');

    print('----------------------------id------------------------------------------');
    print(SharedPreferencesHelper.getUserId());
    print(constant.userId);
    print('----------------------------name------------------------------------------');
    print(SharedPreferencesHelper.getUserName());
    print(constant.userName);
    print('----------------------------email------------------------------------------');
    print(SharedPreferencesHelper.getUserEmail());
    print(constant.userEmail);
    print('----------------------------totalBalance------------------------------------------');
    print(SharedPreferencesHelper.getTotalBalance());
    print(constant.totalBalance);
    print('----------------------------numberOfTransaction------------------------------------------');
    print(SharedPreferencesHelper.getNumberOfTransaction());
    print(constant.numberOfTransaction);
    print('----------------------------avatarId------------------------------------------');
    print(SharedPreferencesHelper.getUserAvatarId());
    print(constant.avatarId);
    print('----------------------------avatarUrl------------------------------------------');
    print(SharedPreferencesHelper.getUserAvatarURL());
    print(constant.avatarUrl);
    print('----------------------------accountCreated------------------------------------------');
    print(SharedPreferencesHelper.getUserAccountCreated());
    print(constant.accountCreated);
    print('----------------------------isloggedin---------------------------------');
    print(SharedPreferencesHelper.getIsLoggedIn());
    print(constant.isLoggedIn);

    print('----------------------------END----------------------------------------');
  }
}

GetUserData getUserData = GetUserData();
