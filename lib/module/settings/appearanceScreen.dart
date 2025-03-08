import 'package:flutter/material.dart';

class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({super.key});

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  bool isDarkMode = false;
  double fontScale = 1.0; // Default font scale (1x)
  Color selectedPrimaryColor = Colors.blue; // Default primary color

  // Font size multipliers
  final Map<String, double> fontScales = {
    '1x': 1.0,
    '1.5x': 1.5,
    '2x': 2.0,
    '3x': 3.0,
  };

  // Primary colors list
  final List<Color> primaryColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appearance"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Dark Mode Toggle
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text("Dark Mode"),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
                // TODO: Integrate with your theme management solution
              },
            ),
          ),
          const Divider(),

          // Font Size Selector (Dropdown with Multipliers)
          ListTile(
            leading: const Icon(Icons.format_size),
            title: const Text("Font Size"),
            trailing: DropdownButton<double>(
              value: fontScale,
              items: fontScales.entries.map((entry) {
                return DropdownMenuItem<double>(
                  value: entry.value,
                  child: Text(
                    entry.key, // Show 1x, 1.5x, 2x, etc.
                    style: TextStyle(fontSize: 16 * entry.value),
                  ),
                );
              }).toList(),
              onChanged: (newScale) {
                setState(() {
                  fontScale = newScale!;
                });
                // TODO: Apply font scale across the app
              },
            ),
          ),
          const Divider(),

          // Primary Color Selector (Color Circles)
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text("Primary Color"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: primaryColors.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPrimaryColor = color;
                    });
                    // TODO: Apply theme color
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: selectedPrimaryColor == color
                          ? Border.all(color: Colors.black, width: 2)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const Divider(),

          // Custom Themes (Optional Navigation)
          // ListTile(
          //   leading: const Icon(Icons.format_paint),
          //   title: const Text("Custom Themes"),
          //   trailing: const Icon(Icons.arrow_forward_ios),
          //   onTap: () {
          //     // Optionally navigate to additional theme settings
          //   },
          // ),
        ],
      ),
    );
  }
}
