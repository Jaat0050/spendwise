import 'package:flutter/material.dart';

class LanguageCurrencyScreen extends StatefulWidget {
  const LanguageCurrencyScreen({super.key});

  @override
  State<LanguageCurrencyScreen> createState() => _LanguageCurrencyScreenState();
}

class _LanguageCurrencyScreenState extends State<LanguageCurrencyScreen> {
  // Default selections
  String selectedLanguage = "English";
  String selectedCurrency = "₹ INR";

  // Language list
  final List<String> languages = [
    "English",
    "Hindi",
    "French",
    "Spanish",
    "German",
    "Chinese",
  ];

  // Currency list
  final List<String> currencies = [
    "₹ INR",
    "\$ USD",
    "€ EUR",
    "£ GBP",
    "¥ JPY",
    "₽ RUB",
  ];

  // Save Function
  void _savePreferences() {
    // TODO: Save language & currency settings to local storage or API
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Saved: $selectedLanguage | $selectedCurrency"),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language & Currency"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Language Selection
            const Text("Select Language", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedLanguage,
              items: languages.map((lang) {
                return DropdownMenuItem<String>(
                  value: lang,
                  child: Text(lang),
                );
              }).toList(),
              onChanged: (newLang) {
                setState(() {
                  selectedLanguage = newLang!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),

            const SizedBox(height: 20),

            // Currency Selection
            const Text("Select Currency", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedCurrency,
              items: currencies.map((currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (newCurrency) {
                setState(() {
                  selectedCurrency = newCurrency!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),

            const SizedBox(height: 40),

            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: _savePreferences,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
