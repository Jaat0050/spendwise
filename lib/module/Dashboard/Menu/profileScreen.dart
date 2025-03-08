import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/module/Dashboard/Menu/editProfileScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture with Edit Icon
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: appColors.blackColor,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
            ),
            const SizedBox(height: 20),
            // User Name
            const Text(
              "John Doe",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // User Email
            Text(
              "johndoe@example.com",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            // Account Information Cards
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: const Icon(Icons.account_balance_wallet, color: Colors.blue),
                title: const Text("Total Balance"),
                subtitle: const Text("₹ 25,000"),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: const Icon(Icons.receipt, color: Colors.green),
                title: const Text("Transactions"),
                subtitle: const Text("150 transactions"),
              ),
            ),
            const SizedBox(height: 16),
            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
