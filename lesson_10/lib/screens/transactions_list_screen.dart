import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../bloc/transaction/transaction_bloc.dart';
import '../bloc/transaction/transaction_state.dart';

class TransactionsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Транзакції'),
        actions: [
          IconButton(
            icon: Icon(Icons.pie_chart),
            onPressed: () => Navigator.pushNamed(context, '/analytics'),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add'),
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state is TransactionsLoaded) {
            final txs = state.transactions;
            return ListView.builder(
              itemCount: txs.length,
              itemBuilder: (ctx, i) {
                final t = txs[i];
                return ListTile(
                  title: Text('${t.category}: ${t.amount.toStringAsFixed(2)}'),
                  subtitle: Text(t.description),
                  trailing: Text(DateFormat.yMd().format(t.date)),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
