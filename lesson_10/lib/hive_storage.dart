import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson_10/models/transaction_model.dart';
import 'package:lesson_10/models/settings_model.dart';

class HiveStorage {
  static late Box<TransactionModel> _txBox;
  static late Box<SettingsModel> _settingsBox;

  /// Ініціалізує Hive, реєструє адаптери та відкриває коробки
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TransactionModelAdapter());
    Hive.registerAdapter(SettingsModelAdapter());

    _txBox = await Hive.openBox<TransactionModel>('transactions');
    _settingsBox = await Hive.openBox<SettingsModel>('settings');
  }

  /// Методи для роботи з транзакціями
  static Future<void> addTransaction(TransactionModel tx) async {
    await _txBox.add(tx);
  }

  static List<TransactionModel> getTransactions() {
    return _txBox.values.toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  static Future<void> deleteTransaction(int index) async {
    await _txBox.deleteAt(index);
  }

  static Future<void> updateTransaction(int index, TransactionModel tx) async {
    await _txBox.putAt(index, tx);
  }

  /// Методи для роботи з налаштуваннями
  static SettingsModel getSettings() {
    return _settingsBox.get('settings')!;
  }

  static Future<void> saveSettings(SettingsModel settings) async {
    await _settingsBox.put('settings', settings);
  }

  static Box<TransactionModel> get txBox => _txBox;
  static Box<SettingsModel> get settingsBox => _settingsBox;

}
