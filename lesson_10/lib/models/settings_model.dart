import 'package:hive/hive.dart';
part 'settings_model.g.dart';

@HiveType(typeId: 1)
class SettingsModel extends HiveObject {
  @HiveField(0)
  String currency;

  @HiveField(1)
  double monthlyBudget;

  SettingsModel({required this.currency, required this.monthlyBudget});
}
