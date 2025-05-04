import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/transaction/transaction_bloc.dart';
import '../bloc/transaction/transaction_state.dart';

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Аналітика')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is TransactionsLoaded) {
              final now = DateTime.now();
              final monthlyTx = state.transactions.where((t) =>
                  t.date.month == now.month && t.date.year == now.year);
              final total = monthlyTx.fold<double>(0, (sum, t) => sum + t.amount);

              final byCategory = <String, double>{};
              for (var t in monthlyTx) {
                byCategory[t.category] = (byCategory[t.category] ?? 0) + t.amount;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Витрати за місяць: ${total.toStringAsFixed(2)}'),
                  ...byCategory.entries.map(
                    (e) => Text('${e.key}: ${e.value.toStringAsFixed(2)}'),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
