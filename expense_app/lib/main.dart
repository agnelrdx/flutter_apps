import 'package:flutter/material.dart';

import 'package:expense_app/widgets/weekly_expenses.dart';
import 'package:expense_app/widgets/expenses.dart';
import 'package:expense_app/widgets/add_expense.dart';
import 'package:expense_app/transaction.dart';

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
      isScrollControlled: true,
      builder: (_) {
        final mediaQuery = MediaQuery.of(ctx);
        final isLandscape = mediaQuery.orientation == Orientation.landscape;
        final insets = mediaQuery.viewInsets.bottom;
        final gutter = !isLandscape ? 0.35 : 0.66;

        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: FractionallySizedBox(
            heightFactor: (insets / 1000) + gutter,
            child: AddExpense(addTransaction: _addTransaction),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final heightFactor = !isLandscape ? 0.75 : 0.45;

    final appBar = AppBar(
      title: const Text('Expense Tracker'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _addExpense(context),
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  elevation: 2,
                  child: WeeklyExpenses(
                    transactions: _transactions,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      heightFactor,
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
