import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';
import '../../models/transaction_model.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final Box<TransactionModel> box;

  TransactionBloc(this.box) : super(TransactionsLoading()) {
    on<LoadTransactions>((_, emit) {
      final data = box.values.toList()
        ..sort((a, b) => b.date.compareTo(a.date));
      emit(TransactionsLoaded(data));
    });

    on<AddTransaction>((event, emit) async {
      await box.add(event.transaction);
      add(LoadTransactions());
    });
  }
}
