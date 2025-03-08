import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appButtons.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appFields.dart';
import 'package:spendwise_app/data/appGradients.dart';
import 'package:spendwise_app/data/appMethods.dart';
import 'package:spendwise_app/data/appValidation.dart';
import 'package:spendwise_app/module/auth/forgetPassword.dart';
import 'package:spendwise_app/module/auth/signUpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logging in...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  // App Name

                  Text(
                    "SpendWise",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: appColors.whiteColor),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Manage your expenses smartly",
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

                  // Password Field

                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    style: TextStyle(color: appColors.whiteColor),
                    decoration: appFields.buildPasswordInputDecoration(
                      "Password",
                      Icons.lock,
                      () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                      _isPasswordVisible,
                    ),
                    validator: appValidations.passwordValidator,
                  ),
                  const SizedBox(height: 10),

                  // Forgot Password

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        AppMethods.navigate(context, const ForgetPasswordScreen());
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: appColors.whiteColor.withOpacity(0.7)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login Button

                  appButton.whiteFullWidthButton('LOGIN', _login),
                  const SizedBox(height: 20),

                  // Sign Up Option

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: appColors.whiteColor.withOpacity(0.7)),
                      ),
                      TextButton(
                        onPressed: () {
                          AppMethods.navigate(context, const SignUpScreen());
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: appColors.whiteColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
