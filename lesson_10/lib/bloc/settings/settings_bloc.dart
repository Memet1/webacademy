import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'settings_event.dart';
import 'settings_state.dart';
import '../../models/settings_model.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final Box<SettingsModel> box;

  SettingsBloc(this.box) : super(SettingsLoading()) {
    on<LoadSettings>((_, emit) {
      if (box.isEmpty) {
        box.put('settings', SettingsModel(currency: 'UAH', monthlyBudget: 0));
      }
      emit(SettingsLoaded(box.get('settings')!));
    });

    on<UpdateSettings>((event, emit) async {
      await box.put('settings', event.settings);
      emit(SettingsLoaded(event.settings));
    });
  }
}
