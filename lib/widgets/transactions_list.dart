import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // TransactionList({super.key});
  final List<Transaction> userT;

  const TransactionList(this.userT, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: userT.isEmpty
          ? Column(
              children: [
                const Text('No transactions added yet'),
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/fonts/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      )),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '\$${userT[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userT[index].title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMd().format(userT[index].date),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ]),
                );
              },
              itemCount: userT.length,
            ),
    );
  }
}
