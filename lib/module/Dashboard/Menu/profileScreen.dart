import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendwise_app/aLocalAndRemoteData/local/constant.dart';
import 'package:spendwise_app/data/appAssets.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appCommonFunctions.dart';
import 'package:spendwise_app/data/appMethods.dart';
import 'package:spendwise_app/module/Dashboard/Menu/editProfileScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 40),

            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: appColors.blackColor,
                backgroundImage: AssetImage(appAssets.dummyUserImage),
              ),
            ),
            const SizedBox(height: 30),

            Text(
              constant.userName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text(
              constant.userEmail,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),

            // Account Information Cards

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.account_balance_wallet, color: Colors.blue),
                title: Text("Total Balance"),
                subtitle: Text(appCommonFunction.formatCurrency(constant.totalBalance)),
              ),
            ),
            const SizedBox(height: 15),

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.receipt, color: Colors.green),
                title: Text("Transactions"),
                subtitle: Text("${constant.numberOfTransaction} transactions"),
              ),
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                AppMethods.navigate(context, const EditProfileScreen());
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text("Edit Profile"),
            ),

            Spacer(),

            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('JOINED :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(width: 10),
                  Text(
                    DateFormat("dd MMMM, yyyy").format(DateTime.parse(constant.accountCreated)),
                    style: TextStyle(fontSize: 16, color: appColors.primaryColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
