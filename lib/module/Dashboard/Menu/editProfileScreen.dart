import 'package:flutter/material.dart';
import 'package:spendwise_app/aLocalAndRemoteData/local/constant.dart';
import 'package:spendwise_app/data/appAssets.dart';
import 'package:spendwise_app/data/appButtons.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appFields.dart';
import 'package:spendwise_app/data/appValidation.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    _nameController.text = constant.userName;
    super.initState();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile Updated')),
      );
      // Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),

              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: appColors.blackColor,
                      backgroundImage: AssetImage(appAssets.dummyUserImage),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: appColors.primaryColor,
                        radius: 18,
                        child: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white, size: 18),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // Name Field

              TextFormField(
                controller: _nameController,
                decoration: appFields.buildInputWithBlackBorderDecoration('Name', Icons.person),
                validator: appValidations.nameValidator,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
        child: appButton.redFullWidthButton('Save', _saveProfile),
      ),
    );
  }
}
