import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spendwise_app/aLocalAndRemoteData/remote/supaBaseFunctions.dart';
import 'package:spendwise_app/data/appButtons.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appCommonFunctions.dart';
import 'package:spendwise_app/data/appFields.dart';
import 'package:spendwise_app/data/appGradients.dart';
import 'package:spendwise_app/data/appValidation.dart';
import 'package:validator_regex/validator_regex.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _otpSent = false;

  bool isSendOtpLoading = false;
  bool isResetPasswordLoading = false;
  Timer? resendTimer;
  int remainingTime = 0;

  Future<void> _sendOrResendOTP(bool isFromResend) async {
    if (!isFromResend) {
      if (!_formKey.currentState!.validate()) return;
    }
    if (!Validator.email(_emailController.text)) {
      appCommonFunction.showSnackbar(message: 'Enter valid email', context: context);
      return;
    }

    setState(() => isSendOtpLoading = true);

    dynamic response = await supabaseFunctions.sendOrResendOTP(email: _emailController.text, context: context);
    if (response == 'success') {
      setState(() {
        _otpSent = true;
        remainingTime = 30;
      });
      _startResendTimer();
    }

    setState(() => isSendOtpLoading = false);
  }

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    if (_newPasswordController.text.length < 6) {
      appCommonFunction.showSnackbar(message: 'Password must be at least 6 characters long.', context: context);
      return;
    }
    if (_newPasswordController.text != _confirmPasswordController.text) {
      appCommonFunction.showSnackbar(message: 'Passwords do not match.', context: context);
      return;
    }

    setState(() => isResetPasswordLoading = true);

    dynamic response = await supabaseFunctions.resetPassword(
      email: _emailController.text,
      otp: _otpController.text,
      newPassword: _newPasswordController.text,
      context: context,
    );
    if (response == 'success') {
      Navigator.pop(context);
    }

    setState(() => isResetPasswordLoading = false);
  }

  void _startResendTimer() {
    resendTimer?.cancel();
    resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime == 0) {
        timer.cancel();
      } else {
        setState(() {
          remainingTime--;
        });
      }
    });
  }

  @override
  void dispose() {
    resendTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    passwordValidator(value) {
      if (value == null || value.isEmpty) {
        return 'Please confirm your password';
      }
      if (value != _newPasswordController.text) {
        return 'Passwords do not match';
      }
      return null;
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(gradient: appGradient.blueGreyWhiteGradient),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title

                  Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: appColors.whiteColor),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Enter your registered email to receive OTP.",
                    style: TextStyle(fontSize: 16, color: appColors.whiteColor.withOpacity(0.7)),
                  ),
                  const SizedBox(height: 40),

                  // Email Field

                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: appColors.whiteColor),
                    decoration: appFields.buildInputDecoration("Email", Icons.email),
                    validator: appValidations.emailValidator,
                    readOnly: _otpSent,
                  ),
                  const SizedBox(height: 20),

                  // Send OTP Button
                  isSendOtpLoading
                      ? const Center(child: CircularProgressIndicator())
                      : remainingTime > 0
                          ? Center(
                              child: Text(
                                "Resend OTP in $remainingTime sec",
                                style: TextStyle(color: appColors.whiteColor.withOpacity(0.7)),
                              ),
                            )
                          : appButton.whiteFullWidthButton(
                              _otpSent ? 'RESEND OTP' : 'SEND OTP',
                              () => _otpSent ? _sendOrResendOTP(true) : _sendOrResendOTP(false),
                            ),
                  const SizedBox(height: 30),

                  // OTP & Password Fields (Only show if OTP is sent)

                  if (_otpSent) ...[
                    // OTP Field

                    TextFormField(
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: appColors.whiteColor),
                      decoration: appFields.buildInputDecoration("Enter OTP", Icons.lock_clock),
                      validator: appValidations.otpValidator,
                    ),
                    const SizedBox(height: 20),

                    // New Password Field

                    TextFormField(
                      controller: _newPasswordController,
                      obscureText: !_isPasswordVisible,
                      style: TextStyle(color: appColors.whiteColor),
                      decoration: appFields.buildPasswordInputDecoration(
                        "New Password",
                        Icons.lock,
                        () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                        _isPasswordVisible,
                      ),
                      validator: appValidations.passwordValidator,
                    ),
                    const SizedBox(height: 20),

                    // Confirm Password Field

                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: !_isConfirmPasswordVisible,
                      style: TextStyle(color: appColors.whiteColor),
                      decoration: appFields.buildPasswordInputDecoration(
                        "Confirm Password",
                        Icons.lock,
                        () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
                        _isConfirmPasswordVisible,
                      ),
                      validator: passwordValidator,
                    ),
                    const SizedBox(height: 30),

                    // Reset Password Button
                    isResetPasswordLoading ? const Center(child: CircularProgressIndicator()) : appButton.whiteFullWidthButton('RESET PASSWORD', _resetPassword),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
