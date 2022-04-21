import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function onClick;

  NewTransaction({required this.onClick, Key? key}) : super(key: key);

  void submitData() {
    final enteredTitle = titleController.text != '' ? titleController.text : 'Default Title';
    final enteredAmount = double.parse(amountController.text != '' ? amountController.text : '0.0');

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    onClick(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitData(),
                // onChanged: (String value) {
                //   inputTitle = value;
                // },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitData(),
              ),
              TextButton(
                onPressed: submitData,
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ));
  }
}
