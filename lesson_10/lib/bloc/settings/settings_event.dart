import 'package:equatable/equatable.dart';
import '../../models/settings_model.dart';

abstract class SettingsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadSettings extends SettingsEvent {}

class UpdateSettings extends SettingsEvent {
  final SettingsModel settings;
  UpdateSettings(this.settings);

  @override
  List<Object?> get props => [settings];
}
