import 'package:flutter/material.dart';
import 'package:spendwise_app/module/Dashboard/Menu/ticketSubmissionScreen.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  // Sample FAQ data
  final List<Map<String, String>> faqs = [
    {"question": "How do I reset my password?", "answer": "To reset your password, go to the Settings page and select 'Reset Password'. Follow the on-screen instructions."},
    {"question": "How do I export my transaction history?", "answer": "Navigate to the Settings section and tap on 'Export Data' to download your transaction history."},
    {"question": "How do I contact support?", "answer": "You can reach us via email at support@spendwise.com or call us at +1 234 567 890."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // FAQ Section
          const Text(
            "Frequently Asked Questions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...faqs.map((faq) => ExpansionTile(
                title: Text(faq["question"]!),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(faq["answer"]!),
                  )
                ],
              )),
          const SizedBox(height: 20),
          // Contact Section
          const Text(
            "Contact Us",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.email, color: Colors.blue),
              title: const Text("Email Support"),
              subtitle: const Text("support@spendwise.com"),
              onTap: () {
                // Implement email support action here (e.g., launch email app)
              },
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.phone, color: Colors.green),
              title: const Text("Call Support"),
              subtitle: const Text("+1 234 567 890"),
              onTap: () {
                // Implement phone call action here (e.g., launch dialer)
              },
            ),
          ),
          const SizedBox(height: 20),
          // Submit Ticket Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TicketSubmissionScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text("Submit a Ticket"),
            ),
          ),
        ],
      ),
    );
  }
}
