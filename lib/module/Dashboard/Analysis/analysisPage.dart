import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:spendwise_app/data/appColors.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  String selectedMonth = 'January';
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  // [Income, Expense, Savings]

  final Map<String, List<double>> financialData = {
    'January': [5000, 3000, 2000],
    'February': [4500, 2500, 2000],
    'March': [6000, 3500, 2500],
    'April': [5500, 2800, 2700],
    'May': [7000, 4000, 3000],
    'June': [6500, 3700, 2800],
    'July': [8000, 5000, 3000],
    'August': [7500, 4500, 3000],
    'September': [7200, 4200, 3000],
    'October': [6800, 3800, 3000],
    'November': [7500, 4200, 3300],
    'December': [8200, 4800, 3400],
  };

  @override
  Widget build(BuildContext context) {
    List<double> data = financialData[selectedMonth] ?? [0, 0, 0];

    return Scaffold(
      backgroundColor: appColors.greyColor.withOpacity(0.05),
      appBar: AppBar(title: const Text('Analysis')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown for month selection

            Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedMonth,
                    isExpanded: true,
                    items: months.map((month) {
                      return DropdownMenuItem(value: month, child: Text(month));
                    }).toList(),
                    onChanged: (value) {
                      setState(() => selectedMonth = value!);
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Card with Pie Chart

            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: data[0],
                          color: Colors.green,
                          title: 'Income',
                          radius: 100,
                          titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        PieChartSectionData(
                          value: data[1],
                          color: Colors.red,
                          title: 'Expense',
                          radius: 100,
                          titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        PieChartSectionData(
                          value: data[2],
                          color: Colors.blue,
                          title: 'Savings',
                          radius: 100,
                          titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLegend(Colors.green, "Income"),
                _buildLegend(Colors.red, "Expense"),
                _buildLegend(Colors.blue, "Savings"),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(Color color, String title) {
    return Row(
      children: [
        Container(width: 16, height: 16, color: color),
        const SizedBox(width: 4),
        Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
