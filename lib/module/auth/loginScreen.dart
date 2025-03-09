import 'package:flutter/material.dart';
import 'package:spendwise_app/aLocalAndRemoteData/remote/getUserData.dart';
import 'package:spendwise_app/aLocalAndRemoteData/remote/supaBaseFunctions.dart';
import 'package:spendwise_app/data/appButtons.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appCommonFunctions.dart';
import 'package:spendwise_app/data/appFields.dart';
import 'package:spendwise_app/data/appGradients.dart';
import 'package:spendwise_app/data/appMethods.dart';
import 'package:spendwise_app/data/appValidation.dart';
import 'package:spendwise_app/module/Dashboard.dart';
import 'package:spendwise_app/module/auth/forgetPassword.dart';
import 'package:spendwise_app/module/auth/signUpScreen.dart';
import 'package:validator_regex/validator_regex.dart';

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
  bool _isButtonLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      if (!Validator.email(_emailController.text)) {
        appCommonFunction.showSnackbar(message: 'Enter valid email', context: context);
        return;
      }

      if (_passwordController.text.length < 6) {
        appCommonFunction.showSnackbar(message: 'Enter valid password', context: context);
        return;
      }

      setState(() => _isButtonLoading = true);

      dynamic response = await supabaseFunctions.logIn(email: _emailController.text, password: _passwordController.text, context: context);
      if (response == 'success') {
        getUserData.getUserData(context);
        AppMethods.navigate(context, const DashboardScreen());
      }

      setState(() => _isButtonLoading = false);
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
                    keyboardType: TextInputType.emailAddress,
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

                  _isButtonLoading ? const Center(child: CircularProgressIndicator()) : appButton.whiteFullWidthButton('LOGIN', _login),
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
