import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  // Dummy notification data
  final List<Map<String, dynamic>> notifications = const [
    // {
    //   "title": "Payment Received",
    //   "description": "Your payment of ₹500 has been received.",
    //   "dateTime": "2025-03-03 10:30 AM",
    //   "icon": Icons.attach_money,
    // },
    // {
    //   "title": "Expense Alert",
    //   "description": "You have exceeded your daily expense limit.",
    //   "dateTime": "2025-03-03 08:00 AM",
    //   "icon": Icons.warning,
    // },
    // {
    //   "title": "New Feature Update",
    //   "description": "Check out the new analytics dashboard in SpendWise.",
    //   "dateTime": "2025-03-02 05:45 PM",
    //   "icon": Icons.update,
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: notifications.isEmpty ? _buildEmptyState() : _buildNotificationList(),
    );
  }

  Widget _buildNotificationList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: notifications.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(notification["icon"], color: Colors.white),
          ),
          title: Text(
            notification["title"],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(notification["description"]),
          trailing: Text(
            notification["dateTime"],
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          onTap: () {
            // Handle notification tap (e.g., navigate to details)
          },
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 20),
          Text(
            "No notifications available",
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
