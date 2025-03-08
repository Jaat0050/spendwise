import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/appIcon.png',
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "SpendWise",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Version 1.0.0", // Update with the actual version
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "About SpendWise",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "SpendWise helps you manage and track your transactions efficiently. "
              "With features like detailed analytics, budgeting tools, and easy backups, "
              "you can stay on top of your finances effortlessly.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Contact Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text("support@spendwise.com"),
              onTap: () {
                // Add email intent
              },
            ),
            ListTile(
              leading: const Icon(Icons.public),
              title: const Text("www.spendwise.com"),
              onTap: () {
                // Open website
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text("Privacy Policy"),
              onTap: () {
                // Navigate to privacy policy screen or web link
              },
            ),
          ],
        ),
      ),
    );
  }
}
