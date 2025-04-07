import 'package:flutter/material.dart';
import 'package:spendwise_app/aLocalAndRemoteData/local/constant.dart';
import 'package:spendwise_app/aLocalAndRemoteData/remote/getUserData.dart';
import 'package:spendwise_app/data/appButtons.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appCommonFunctions.dart';
import 'package:spendwise_app/data/appCommonWidgets.dart';
import 'package:spendwise_app/data/appFields.dart';
import 'package:spendwise_app/data/appValidation.dart';
import 'package:spendwise_app/module/Dashboard/Menu/avatorSelectionDialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final supabase = Supabase.instance.client;
  List avatarUrls = [];
  bool isButtonLoading = false;

  @override
  void initState() {
    _nameController.text = constant.userName;
    super.initState();
  }

  void _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isButtonLoading = true;
      });
      final userId = supabase.auth.currentUser?.id;
      try {
        await supabase.from('users').update({'name': _nameController.text}).eq('id', userId!).then((response) {
              getUserData.getUserData(context).then((value) {
                setState(() {});
              });
            });

        appCommonFunction.showSnackbar(message: 'Name Updated', context: context);
      } catch (e) {
        print('==================catch error');
        print(e.toString());
      }

      setState(() {
        isButtonLoading = false;
      });
    }
  }

  showAvatar(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AvatarSelectionDialog();
      },
    ).then((value) async {
      if (value != null) {
        final userId = supabase.auth.currentUser?.id;

        try {
          await supabase.from('users').update({'avatar_id': value['id'], 'avatar_url': value['url']}).eq('id', userId!).then((response) {
                getUserData.getUserData(context).then((value) {
                  setState(() {});
                });
              });
          appCommonFunction.showSnackbar(message: 'Profile Picture Updated', context: context);
        } catch (e) {
          print('==================catch error');
          print(e.toString());
        }
      }
    });
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
                    appCommonWidget.circularImageViewBuilder(imageLink: constant.avatarUrl, radius: 160, iconSize: 40),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: appColors.primaryColor,
                        radius: 18,
                        child: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white, size: 18),
                          onPressed: () => showAvatar(context),
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
        child: isButtonLoading ? SizedBox(height: 50, child: Center(child: CircularProgressIndicator())) : appButton.redFullWidthButton('Save', _saveProfile),
      ),
    );
  }
}
