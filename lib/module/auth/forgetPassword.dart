import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appButtons.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appFields.dart';
import 'package:spendwise_app/data/appGradients.dart';
import 'package:spendwise_app/data/appValidation.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _otpSent = false; // Track whether OTP has been sent

  void _sendOTP() {
    if (_emailController.text.isNotEmpty && RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(_emailController.text)) {
      setState(() {
        _otpSent = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP Sent to Email')),
      );
    }
  }

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password Reset Successfully!')),
      );
      Navigator.pop(context);
    }
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
                  ),
                  const SizedBox(height: 20),

                  // Send OTP Button

                  !_otpSent ? appButton.whiteFullWidthButton('SEND OTP', _sendOTP) : Container(),
                  _otpSent ? const SizedBox(height: 30) : Container(),

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
                        () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                        _isPasswordVisible,
                      ),
                      validator: passwordValidator,
                    ),
                    const SizedBox(height: 30),

                    // Reset Password Button
                    appButton.whiteFullWidthButton('RESET PASSWORD', _resetPassword),
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
