import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function onClick;

  NewTransaction({required this.onClick, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                // onChanged: (String value) {
                //   inputTitle = value;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              TextButton(
                onPressed: () {
                  onClick(titleController.text != '' ? titleController.text : 'Default Title',
                      double.parse(amountController.text != '' ? amountController.text : '0.0'));
                },
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ));
  }
}
