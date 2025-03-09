import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final SharedPreferencesHelper _instance = SharedPreferencesHelper._ctor();

  static String userId = 'USERID';
  static String userName = 'USERNAME';
  static String userEmail = 'USEREMAIL';
  static String accountCreated = 'ACCOUNTCREATED';
  static String totalBalance = 'TOTALBALANCE';
  static String numberOfTransaction = 'NUMBEROFTRANSACTION';
  static String isLoggedIn = 'ISLOGGEDIN';

  factory SharedPreferencesHelper() {
    return _instance;
  }

  SharedPreferencesHelper._ctor();
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //---------------------------------------------------------------

  static void setUserId({required String id}) {
    _prefs.setString(userId, id);
  }

  static String getUserId() {
    return _prefs.getString(userId) ?? '';
  }

  //---------------------------------------------------------------

  static void setUserName({required String name}) {
    _prefs.setString(userName, name);
  }

  static String getUserName() {
    return _prefs.getString(userName) ?? '';
  }

  //---------------------------------------------------------------

  static void setUserEmail({required String email}) {
    _prefs.setString(userEmail, email);
  }

  static String getUserEmail() {
    return _prefs.getString(userEmail) ?? '';
  }

  //---------------------------------------------------------------

  static void setTotalBalance({required int total}) {
    _prefs.setInt(totalBalance, total);
  }

  static int getTotalBalance() {
    return _prefs.getInt(totalBalance) ?? 0;
  }

  //---------------------------------------------------------------

  static void setNumberOfTransaction({required int transactions}) {
    _prefs.setInt(numberOfTransaction, transactions);
  }

  static int getNumberOfTransaction() {
    return _prefs.getInt(numberOfTransaction) ?? 0;
  }

  //---------------------------------------------------------------

  static void setUserAccountCreated({required String date}) {
    _prefs.setString(accountCreated, date);
  }

  static String getUserAccountCreated() {
    return _prefs.getString(accountCreated) ?? '';
  }

  //-------------------------------------------------------------------

  static void setIsLoggedIn({required bool loggedIn}) {
    _prefs.setBool(isLoggedIn, loggedIn);
  }

  static bool getIsLoggedIn() {
    return _prefs.getBool(isLoggedIn) ?? false;
  }

  //-------------------------------------------------------------------
  static void clearShareCache() {
    _prefs.clear();
  }

  //
}
