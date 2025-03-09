import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/models/transactionModel.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  final List<TransactionModel> dummyTransactions = [
    TransactionModel(id: "1", title: "Coffee", amount: 50, date: DateTime(2025, 3, 3, 8, 30), type: "Expense"),
    TransactionModel(id: "2", title: "Freelance Work", amount: 1200, date: DateTime(2025, 3, 3, 14, 15), type: "Income"),
    TransactionModel(id: "3", title: "Groceries", amount: 450, date: DateTime(2025, 3, 3, 19, 45), type: "Expense"),
    TransactionModel(id: "4", title: "Electricity Bill", amount: 2000, date: DateTime(2025, 3, 2, 10, 0), type: "Expense"),
    TransactionModel(id: "5", title: "Dining Out", amount: 800, date: DateTime(2025, 3, 1, 21, 30), type: "Expense"),
    TransactionModel(id: "6", title: "Salary", amount: 5000, date: DateTime(2025, 3, 1, 9, 0), type: "Income"),
    TransactionModel(id: "7", title: "Gym Membership", amount: 1000, date: DateTime(2025, 2, 25, 18, 15), type: "Expense"),
    TransactionModel(id: "8", title: "Freelance Payment", amount: 2000, date: DateTime(2025, 2, 27, 12, 0), type: "Income"),
    TransactionModel(id: "9", title: "Shopping", amount: 500, date: DateTime(2025, 2, 23, 16, 45), type: "Expense"),
    TransactionModel(id: "10", title: "Rent", amount: 15000, date: DateTime(2025, 2, 5, 10, 0), type: "Expense"),
    TransactionModel(id: "11", title: "Investment Returns", amount: 3000, date: DateTime(2025, 1, 20, 13, 0), type: "Income"),
    TransactionModel(id: "12", title: "Car Insurance", amount: 7000, date: DateTime(2025, 1, 10, 15, 30), type: "Expense"),
  ];

  List<TransactionModel> _filterTransactionsForToday() {
    DateTime now = DateTime.now();
    return dummyTransactions.where((tx) => tx.date.year == now.year && tx.date.month == now.month && tx.date.day == now.day).toList()
      ..sort(
        (a, b) => b.date.compareTo(a.date),
      );
  }

  List<TransactionModel> _filterTransactionsForWeek() {
    DateTime now = DateTime.now();
    DateTime weekAgo = now.subtract(const Duration(days: 6));
    return dummyTransactions.where((tx) => tx.date.isAfter(weekAgo) && tx.date.isBefore(now.add(const Duration(days: 1)))).toList()
      ..sort(
        (a, b) => b.date.compareTo(a.date),
      );
  }

  List<TransactionModel> _filterTransactionsForMonth() {
    DateTime now = DateTime.now();
    return dummyTransactions.where((tx) => tx.date.year == now.year && tx.date.month == now.month).toList()
      ..sort(
        (a, b) => b.date.compareTo(a.date),
      );
  }

  List<TransactionModel> _filterTransactionsForYear() {
    DateTime now = DateTime.now();
    return dummyTransactions.where((tx) => tx.date.year == now.year).toList()
      ..sort(
        (a, b) => b.date.compareTo(a.date),
      );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.greyColor.withOpacity(0.05),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Transactions"),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "Today"),
            Tab(text: "Week"),
            Tab(text: "Month"),
            Tab(text: "Year"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTransactionList(_filterTransactionsForToday()),
          _buildTransactionList(_filterTransactionsForWeek()),
          _buildTransactionList(_filterTransactionsForMonth()),
          _buildTransactionList(_filterTransactionsForYear()),
        ],
      ),
    );
  }

  Widget _buildTransactionList(List<TransactionModel> transactions) {
    if (transactions.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.separated(
      padding: const EdgeInsets.all(12.0),
      itemCount: transactions.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        var transaction = transactions[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: transaction.type == "Income" ? Colors.green : Colors.red,
              child: Icon(transaction.type == "Income" ? CupertinoIcons.add : CupertinoIcons.minus, color: Colors.white),
            ),
            title: Text(transaction.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: Text(
              DateFormat("yyyy-MM-dd hh:mm a").format(transaction.date),
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: Text(
              "₹ ${transaction.amount.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: transaction.type == "Income" ? Colors.green : Colors.red),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 20),
          Text(
            "No transactions found",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 10),
          Text(
            "Start adding transactions to track your expenses and income.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
