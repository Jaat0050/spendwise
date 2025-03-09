import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/module/Dashboard/Menu/profileScreen.dart';
import 'package:spendwise_app/module/Dashboard/Menu/settingsScreen.dart';
import 'package:spendwise_app/module/Dashboard/Menu/supportScreen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: appColors.greyColor.withOpacity(0.05),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text("Menu"),
          bottom: TabBar(
            indicatorColor: appColors.whiteColor,
            tabs: const [
              Tab(text: "Profile", icon: Icon(Icons.person)),
              Tab(text: "Settings", icon: Icon(Icons.settings)),
              Tab(text: "Support", icon: Icon(Icons.help_outline)),
              Tab(text: "Logout", icon: Icon(Icons.logout)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const ProfileScreen(),
            const SettingsScreen(),
            const SupportScreen(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
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
