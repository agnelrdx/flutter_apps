import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  final Function addTransaction;

  const AddExpense({super.key, required this.addTransaction});

  @override
  State<StatefulWidget> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  dynamic _selectedDate;

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    Theme.of(context).primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _addTransaction() {
    final title = _titleController.text;
    final amount = _amountController.text;

    if (title.isEmpty || amount.isEmpty || _selectedDate == null) {
      return;
    }

    final amountParsed = double.parse(_amountController.text);

    if (amountParsed <= 0) {
      return;
    }

    widget.addTransaction(
      _titleController.text,
      amountParsed,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
          bottom: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              controller: _titleController,
              cursorColor: Theme.of(context).primaryColor,
              onSubmitted: (_) => {},
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              controller: _amountController,
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => {},
              // onChanged: (val) => amountInput = val,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _showDatePicker(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text('Pick a date'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _addTransaction,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
