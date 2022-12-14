import 'package:flutter/material.dart';

import 'widgets/weekly_expenses.dart';
import 'widgets/expenses.dart';
import 'widgets/add_expense.dart';
import './transaction.dart';

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

class ExpenseAppPage extends StatefulWidget {
  const ExpenseAppPage({super.key});

  @override
  State<StatefulWidget> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseAppPage> {
  final List<Transaction> _transactions = [];

  void _addTransaction(String title, double amount, DateTime date) {
    final transaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );

    setState(() {
      _transactions.add(transaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((value) => value.id == id);
    });
  }

  Future<void> _addExpense(BuildContext ctx) async {
    await showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: AddExpense(addTransaction: _addTransaction),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
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
                  height:
                      (mediaQuery.size.height - mediaQuery.padding.top) * 0.7,
                  child: Expenses(
                    transactions: _transactions,
                    deleteTransaction: _deleteTransaction,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _addExpense(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
