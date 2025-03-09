import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appGradients.dart';
import 'package:spendwise_app/module/Dashboard/Home/addExpenseScreen.dart';
import 'package:spendwise_app/module/Dashboard/Home/addIncomeScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedMonth = "January";
  int _totalIncome = 1200;
  int _totalExpense = 800;

  final List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: appColors.greyColor.withOpacity(0.05),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("SpendWise"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Month Selection Dropdown

            Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedMonth,
                    isExpanded: true,
                    items: _months.map((month) {
                      return DropdownMenuItem(value: month, child: Text(month));
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _selectedMonth = value!);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Income & Expense Indicators

            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildIndicator("Income", _totalIncome, Colors.green)),
                      const SizedBox(width: 10),
                      Expanded(child: _buildIndicator("Expense", _totalExpense, Colors.red)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Balance Card (Takes Space)

                  Expanded(
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: appGradient.blueGreyWhiteGradient),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Balance",
                              style: TextStyle(fontSize: 25, color: appColors.whiteColor.withOpacity(0.7)),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "₹ ${(_totalIncome - _totalExpense)}",
                              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: appColors.whiteColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Buttons at Bottom

            SizedBox(
              height: height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    "Add Expense",
                    Icons.remove_circle,
                    appColors.redColor,
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpenseScreen()));
                    },
                  ),
                  _buildActionButton(
                    "Add Income",
                    Icons.add_circle,
                    appColors.greenColor,
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddIncomeScreen()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(String title, int amount, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(
              "₹ $amount",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon, Color color, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
