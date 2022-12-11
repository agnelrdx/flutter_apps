import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

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
                child: const Padding(
                  padding: EdgeInsets.all(3),
                  child: FittedBox(
                    child: Text(
                      '\$100',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Rent',
                  style: TextStyle(
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
                onPressed: () => {},
              ),
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }
}
