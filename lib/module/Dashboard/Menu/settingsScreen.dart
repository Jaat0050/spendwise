import 'package:flutter/material.dart';
import 'package:spendwise_app/module/settings/aboutScreen.dart';
import 'package:spendwise_app/module/settings/appearanceScreen.dart';
import 'package:spendwise_app/module/settings/dataManagementScreen.dart';
import 'package:spendwise_app/module/settings/languageCurrencyScreen.dart';
import 'package:spendwise_app/module/settings/notificationScreen.dart';
import 'package:spendwise_app/module/settings/privacySecurityScreen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Notifications
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            subtitle: const Text('Manage push notifications'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationScreen()),
              );
            },
          ),
          const Divider(),

          // Appearance
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Appearance'),
            subtitle: const Text('Light or Dark theme'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AppearanceScreen()),
              );
            },
          ),
          const Divider(),

          // Language & Currency
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language & Currency'),
            subtitle: const Text('Select language and currency'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LanguageCurrencyScreen()),
              );
            },
          ),
          const Divider(),

          // Privacy & Security
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Privacy & Security'),
            subtitle: const Text('Manage privacy settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacySecurityScreen()),
              );
            },
          ),
          const Divider(),

          // Data Management
          ListTile(
            leading: const Icon(Icons.data_usage),
            title: const Text('Data Management'),
            subtitle: const Text('Export data, clear cache'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DataManagementScreen()),
              );
            },
          ),
          const Divider(),

          // About Section
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            subtitle: const Text('App info, version, and licenses'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
