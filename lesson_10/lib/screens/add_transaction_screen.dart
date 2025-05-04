import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../bloc/transaction/transaction_bloc.dart';
import '../bloc/transaction/transaction_event.dart';
import '../models/transaction_model.dart';

class AddTransactionScreen extends StatefulWidget {
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  double? _amount;
  String? _desc;
  String? _category;
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Додати транзакцію')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Загальна сума'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (v) => v!.isEmpty ? 'Введіть загальну суму' : null,
                onSaved: (v) => _amount = double.parse(v!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Опис'),
                validator: (v) => v!.isEmpty ? 'Введіть опис' : null,
                onSaved: (v) => _desc = v,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Категорії'),
                items: ['Їжа', 'Транспорт', 'Розваги', 'Інше']
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                validator: (v) => v == null ? 'Оберіть категорію' : null,
                onChanged: (v) => _category = v,
              ),
              ListTile(
                title: Text('Date: ${DateFormat.yMd().format(_date)}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) setState(() => _date = picked);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final tx = TransactionModel(
                      amount: _amount!,
                      description: _desc!,
                      category: _category!,
                      date: _date,
                    );
                    context.read<TransactionBloc>().add(AddTransaction(tx));
                    Navigator.pop(context);
                  }
                },
                child: Text('Додати'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
