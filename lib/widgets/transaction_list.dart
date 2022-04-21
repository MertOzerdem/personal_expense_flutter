import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 102, 173, 231),
                          width: 2.0,
                          style: BorderStyle.solid)),
                  padding: const EdgeInsets.all(10),
                  child: Text('¥: ${transactions[index].amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 102, 173, 231))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(transactions[index].title,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(DateFormat().format(transactions[index].date),
                        style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
