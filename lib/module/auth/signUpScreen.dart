import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appButtons.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appFields.dart';
import 'package:spendwise_app/data/appGradients.dart';
import 'package:spendwise_app/data/appValidation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _selectedGender;
  bool _termsAccepted = false;

  void _signUp() {
    if (_formKey.currentState!.validate() && _termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account Created Successfully!')),
      );
      // Navigate to Home or Login Screen
    } else if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept Terms and Conditions')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    passwordValidator(value) {
      if (value == null || value.isEmpty) {
        return 'Please confirm your password';
      }
      if (value != _passwordController.text) {
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
                    "Create Account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: appColors.whiteColor),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Sign up to continue.",
                    style: TextStyle(fontSize: 16, color: appColors.whiteColor.withOpacity(0.7)),
                  ),
                  const SizedBox(height: 40),

                  // Name Field

                  TextFormField(
                    controller: _nameController,
                    style: TextStyle(color: appColors.whiteColor),
                    decoration: appFields.buildInputDecoration("Full Name", Icons.person),
                    validator: appValidations.nameValidator,
                  ),
                  const SizedBox(height: 20),

                  // Email Field

                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: appColors.whiteColor),
                    decoration: appFields.buildInputDecoration("Email", Icons.email),
                    validator: appValidations.emailValidator,
                  ),
                  const SizedBox(height: 20),

                  // Gender Dropdown

                  DropdownButtonFormField<String>(
                    dropdownColor: appColors.blackColor.withOpacity(0.87),
                    value: _selectedGender,
                    style: TextStyle(color: appColors.whiteColor),
                    decoration: appFields.buildInputDecoration("Gender", Icons.wc),
                    items: ["Male", "Female", "Other"]
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender, style: TextStyle(color: appColors.whiteColor)),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => _selectedGender = value),
                    validator: (value) => value == null ? "Select your gender" : null,
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
                  const SizedBox(height: 20),

                  // Terms & Conditions Checkbox

                  Row(
                    children: [
                      Checkbox(
                        value: _termsAccepted,
                        checkColor: appColors.blackColor,
                        activeColor: appColors.whiteColor,
                        onChanged: (value) => setState(() => _termsAccepted = value!),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _termsAccepted = !_termsAccepted),
                          child: Text(
                            "I agree to the Terms & Conditions",
                            style: TextStyle(fontSize: 14, color: appColors.whiteColor, decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  appButton.whiteFullWidthButton('SIGN UP', _signUp),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: appColors.whiteColor.withOpacity(0.7)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
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
