import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/settings/settings_bloc.dart';
import '../bloc/settings/settings_event.dart';
import '../bloc/settings/settings_state.dart';
import '../models/settings_model.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _currency;
  late double _budget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Налаштування')),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoaded) {
            _currency = state.settings.currency;
            _budget = state.settings.monthlyBudget;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: _currency,
                      items: ['UAH', 'USD', 'EUR']
                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onChanged: (v) => _currency = v!,
                      decoration: InputDecoration(labelText: 'Валюта'),
                    ),
                    TextFormField(
                      initialValue: _budget.toString(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Місячний бюджет'),
                      validator: (v) => v!.isEmpty ? 'Додайте бюджет' : null,
                      onSaved: (v) => _budget = double.parse(v!),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final newSettings =
                              SettingsModel(currency: _currency, monthlyBudget: _budget);
                          context.read<SettingsBloc>().add(UpdateSettings(newSettings));
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Зберегти'),
                    )
                  ],
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
