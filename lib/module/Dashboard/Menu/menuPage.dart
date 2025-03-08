import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/module/Dashboard/Menu/profileScreen.dart';
import 'package:spendwise_app/module/Dashboard/Menu/settingsScreen.dart';
import 'package:spendwise_app/module/Dashboard/Menu/supportScreen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using DefaultTabController to manage the tab state
    return DefaultTabController(
      length: 4, // Four tabs: Profile, Settings, Support, Logout
      child: Scaffold(
        backgroundColor: appColors.greyColor.withOpacity(0.05),
        appBar: AppBar(
          title: const Text("Menu"),
          bottom: TabBar(
            indicatorColor: appColors.whiteColor,
            tabs: [
              Tab(
                text: "Profile",
                icon: Icon(Icons.person),
              ),
              Tab(
                text: "Settings",
                icon: Icon(Icons.settings),
              ),
              Tab(
                text: "Support",
                icon: Icon(Icons.help_outline),
              ),
              Tab(
                text: "Logout",
                icon: Icon(Icons.logout),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // My Profile Tab
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: const [
            //       Icon(Icons.person, size: 100, color: Colors.blue),
            //       SizedBox(height: 20),
            //       Text(
            //         "My Profile",
            //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
            ProfileScreen(),
            // Settings Tab
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: const [
            //       Icon(Icons.settings, size: 100, color: Colors.orange),
            //       SizedBox(height: 20),
            //       Text(
            //         "Settings",
            //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
            SettingsScreen(),
            // Support Tab
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: const [
            //       Icon(Icons.support_agent, size: 100, color: Colors.green),
            //       SizedBox(height: 20),
            //       Text(
            //         "Support",
            //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),

            SupportScreen(),
            // Logout Tab
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Implement your logout functionality here
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
