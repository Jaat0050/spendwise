class UserDataModel {
  final String? id;
  final String? name;
  final String? email;
  final int? totalBalance;
  final int? numberOfTransaction;
  final String? avatarId;
  final String? avatarUrl;
  final String? created;

  UserDataModel({
    this.id,
    this.name,
    this.email,
    this.totalBalance,
    this.numberOfTransaction,
    this.avatarId,
    this.avatarUrl,
    this.created,
  });

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      totalBalance: map['total_balance'] ?? '',
      numberOfTransaction: map['number_of_transactions'] ?? '',
      avatarId: map['avatar_id'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
      created: map['created_at'] ?? '',
    );
  }
}
