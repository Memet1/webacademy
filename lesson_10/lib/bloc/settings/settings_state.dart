import 'package:equatable/equatable.dart';
import '../../models/settings_model.dart';

abstract class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final SettingsModel settings;
  SettingsLoaded(this.settings);

  @override
  List<Object?> get props => [settings];
}
