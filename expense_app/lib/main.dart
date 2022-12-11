import 'package:flutter/material.dart';

import 'widgets/weekly_expenses.dart';
import 'widgets/expenses.dart';
import 'widgets/add_expense.dart';

void main() {
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primaryColor: Colors.teal,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
        ),
      ),
      home: const ExpenseAppPage(),
    );
  }
}

class ExpenseAppPage extends StatelessWidget {
  const ExpenseAppPage({super.key});

  Future<void> _addExpense(BuildContext ctx) async {
    await showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: const AddExpense(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addExpense(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Card(
              elevation: 2,
              child: WeeklyExpenses(),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.7,
              child: const Expenses(),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _addExpense(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
