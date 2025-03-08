import 'package:flutter/material.dart';

class DataManagementScreen extends StatelessWidget {
  const DataManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _clearCache(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Clear Cache"),
          content: const Text("Are you sure you want to clear the cache?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Clear cache logic here
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cache cleared successfully")),
                );
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      );
    }

    void _exportData(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (context) => Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.table_chart),
              title: const Text("Export as CSV"),
              onTap: () {
                Navigator.pop(context);
                // Export CSV logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Data exported as CSV")),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.picture_as_pdf),
              title: const Text("Export as PDF"),
              onTap: () {
                Navigator.pop(context);
                // Export PDF logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Data exported as PDF")),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text("Export as JSON"),
              onTap: () {
                Navigator.pop(context);
                // Export JSON logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Data exported as JSON")),
                );
              },
            ),
          ],
        ),
      );
    }

    void _deleteAccount(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Delete Account"),
          content: const Text("This action is irreversible. Do you want to proceed?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Delete account logic
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Account deleted successfully")),
                );
                // Navigate to login or onboarding screen
              },
              child: const Text("Delete"),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Data Management")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.delete_sweep, color: Colors.red),
              title: const Text("Clear Cache & App Data"),
              subtitle: const Text("Removes temporary files and resets app storage."),
              trailing: IconButton(
                icon: const Icon(Icons.clear, color: Colors.red),
                onPressed: () => _clearCache(context),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.download, color: Colors.blue),
              title: const Text("Export Data"),
              subtitle: const Text("Save your transactions as CSV, PDF, or JSON."),
              trailing: IconButton(
                icon: const Icon(Icons.file_download, color: Colors.blue),
                onPressed: () => _exportData(context),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.backup, color: Colors.green),
              title: const Text("Backup Data"),
              subtitle: const Text("Create a secure backup of your data."),
              trailing: IconButton(
                icon: const Icon(Icons.cloud_upload, color: Colors.green),
                onPressed: () {
                  // Backup data function
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete_forever, color: Colors.redAccent),
              title: const Text("Delete Account"),
              subtitle: const Text("Permanently remove your account and all data."),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () => _deleteAccount(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
