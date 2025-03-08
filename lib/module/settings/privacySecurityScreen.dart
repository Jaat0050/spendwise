import 'package:flutter/material.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  State<PrivacySecurityScreen> createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool isBiometricEnabled = false;
  bool isTwoFactorAuthEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy & Security")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Biometric Authentication Toggle
            SwitchListTile(
              title: const Text("Face ID / Fingerprint Unlock"),
              subtitle: const Text("Use biometric authentication to unlock the app."),
              value: isBiometricEnabled,
              onChanged: (value) {
                setState(() {
                  isBiometricEnabled = value;
                });
              },
            ),

            // 2-Factor Authentication Toggle
            SwitchListTile(
              title: const Text("Two-Factor Authentication"),
              subtitle: const Text("Enhance security by requiring a code for login."),
              value: isTwoFactorAuthEnabled,
              onChanged: (value) {
                setState(() {
                  isTwoFactorAuthEnabled = value;
                });
              },
            ),

            const SizedBox(height: 30),

            // Privacy Policy Button
            ListTile(
              leading: const Icon(Icons.privacy_tip, color: Colors.blue),
              title: const Text("Privacy Policy"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // TODO: Navigate to Privacy Policy screen
              },
            ),

            // Terms & Conditions Button
            ListTile(
              leading: const Icon(Icons.article, color: Colors.green),
              title: const Text("Terms & Conditions"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // TODO: Navigate to Terms & Conditions screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
