// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:spendwise_app/data/appCommonFunctions.dart';

class SupabaseFunctions {
  static final SupabaseFunctions _instance = SupabaseFunctions._internal();
  factory SupabaseFunctions() => _instance;
  SupabaseFunctions._internal();

  static final SupabaseClient _supabase = Supabase.instance.client;

  //------------------------------------ Login -------------------------------------//

  Future<dynamic> logIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email.trim(),
        password: password.trim(),
      );

      if (response.session != null) {
        appCommonFunction.showSuccessSnackbar(message: "Login Successful", context: context);
        return 'success';
      } else {
        appCommonFunction.showErrorSnackbar(message: "Invalid credentials, please try again.", context: context);
        return null;
      }
    } on AuthException catch (e) {
      appCommonFunction.showErrorSnackbar(message: e.message, context: context);
      return null;
    } catch (e) {
      appCommonFunction.showErrorSnackbar(message: "An error occurred. Please try again.", context: context);
      return null;
    }
  }

  //------------------------------------ signup -------------------------------------//

  Future<dynamic> signUp({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final AuthResponse response = await _supabase.auth.signUp(email: email.trim(), password: password);
      final User? user = response.user;

      if (user != null) {
        try {
          await _supabase.from('users').insert({
            'id': user.id,
            'name': name.trim(),
            'email': email.trim(),
            'created_at': DateTime.now().toIso8601String(),
          });

          appCommonFunction.showSuccessSnackbar(message: 'Account created successfully! Redirecting...', context: context);
          return 'success';
        } catch (dbError) {
          appCommonFunction.showErrorSnackbar(message: "Failed to save user data. Please try again.", context: context);
          return null;
        }
      } else {
        appCommonFunction.showErrorSnackbar(message: "Sign-up failed. Please try again.", context: context);
        return null;
      }
    } on AuthException catch (e) {
      appCommonFunction.showErrorSnackbar(message: e.message, context: context);
      return null;
    } catch (e) {
      appCommonFunction.showErrorSnackbar(message: "An unexpected error occurred. Please try again.", context: context);
      return null;
    }
  }

  //------------------------------------ sendOrResendOTP -------------------------------------//

  Future<dynamic> sendOrResendOTP({
    required String email,
    required BuildContext context,
  }) async {
    try {
      await _supabase.auth.signInWithOtp(email: email.trim());
      appCommonFunction.showSuccessSnackbar(message: "OTP Sent to Email", context: context);
      return 'success';
    } on AuthException catch (e) {
      appCommonFunction.showErrorSnackbar(message: e.message, context: context);
      return null;
    } catch (e) {
      appCommonFunction.showErrorSnackbar(message: "Something went wrong. Try again.", context: context);
      return null;
    }
  }

  //------------------------------------ resetPassword -------------------------------------//

  Future<dynamic> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
    required BuildContext context,
  }) async {
    try {
      final response = await _supabase.auth.verifyOTP(
        email: email.trim(),
        token: otp.trim(),
        type: OtpType.recovery,
      );

      if (response.session == null) {
        appCommonFunction.showErrorSnackbar(message: "Invalid OTP. Try again.", context: context);
        return null;
      }

      await _supabase.auth.updateUser(UserAttributes(password: newPassword.trim()));
      appCommonFunction.showSuccessSnackbar(message: "Password Reset Successfully!", context: context);
      return 'success';
    } on AuthException catch (e) {
      appCommonFunction.showErrorSnackbar(message: e.message, context: context);
      return null;
    } catch (e) {
      appCommonFunction.showErrorSnackbar(message: "Something went wrong. Try again.", context: context);
      return null;
    }
  }

  //------------------------------------ Logout -------------------------------------//

  Future<void> logout(BuildContext context) async {
    try {
      await _supabase.auth.signOut();
      appCommonFunction.showSuccessSnackbar(message: "Logged out successfully", context: context);
    } catch (e) {
      appCommonFunction.showErrorSnackbar(message: "Failed to log out. Try again.", context: context);
    }
  }

  //------------------------------------ Fetch User Data -------------------------------------//

  Future<dynamic> getUserData(BuildContext context) async {
    try {
      final user = _supabase.auth.currentUser;

      if (user == null) {
        appCommonFunction.showErrorSnackbar(message: "No user logged in", context: context);
        return null;
      }
      
      final response = await _supabase.from('users').select().eq('id', user.id).single();
      return response;
    } on PostgrestException catch (e) {
      appCommonFunction.showErrorSnackbar(message: e.message, context: context);
      return null;
    } catch (e) {
      appCommonFunction.showErrorSnackbar(message: "Failed to fetch user data", context: context);
      return null;
    }
  }

  //
}

final SupabaseFunctions supabaseFunctions = SupabaseFunctions();
