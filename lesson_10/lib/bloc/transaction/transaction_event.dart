import 'package:equatable/equatable.dart';
import '../../models/transaction_model.dart';

abstract class TransactionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTransactions extends TransactionEvent {}

class AddTransaction extends TransactionEvent {
  final TransactionModel transaction;
  AddTransaction(this.transaction);

  @override
  List<Object?> get props => [transaction];
}
