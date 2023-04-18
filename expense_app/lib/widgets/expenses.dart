import 'package:flutter/material.dart';
import 'package:expense_app/transaction.dart';

class Expenses extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  const Expenses(
      {super.key, required this.transactions, required this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: FittedBox(
                    child: Text(
                      '\$${transactions[index].amount}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  transactions[index].title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              subtitle: const Text('26/12/2022',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.grey,
                onPressed: () => deleteTransaction(transactions[index].id),
              ),
            ),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}
