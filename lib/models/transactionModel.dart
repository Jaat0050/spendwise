class TransactionModel {
  final String id;
  final String title;
  final int amount;
  final DateTime date;
  final String type;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      amount: map['amount'] ?? 0,
      date: map['date'] ?? '',
      type: map['type'] ?? 'Expense',
    );
  }
}
