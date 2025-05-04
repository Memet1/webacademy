import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_10/hive_storage.dart';

import 'bloc/transaction/transaction_bloc.dart';
import 'bloc/transaction/transaction_event.dart';
import 'bloc/settings/settings_bloc.dart';
import 'bloc/settings/settings_event.dart';

import 'screens/transactions_list_screen.dart';
import 'screens/add_transaction_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/analytics_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ініціалізація Hive та відкриття бокса
  await HiveStorage.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => TransactionBloc(HiveStorage.txBox)..add(LoadTransactions()),
      ),
      BlocProvider(
        create: (_) => SettingsBloc(HiveStorage.settingsBox)..add(LoadSettings()),
      ),
    ],
    child: FinanceApp(),
  ));
}

class FinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (_) => TransactionsListScreen(),
        '/add': (_) => AddTransactionScreen(),
        '/settings': (_) => SettingsScreen(),
        '/analytics': (_) => AnalyticsScreen(),
      },
    );
  }
}
