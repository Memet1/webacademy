import 'package:hive/hive.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  final double amount;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final DateTime date;

  TransactionModel({
    required this.amount,
    required this.category,
    required this.date,
    required this.description,
  });
}
