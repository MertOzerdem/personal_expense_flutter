import 'package:flutter/material.dart';
import 'widgets/new_transaction.dart';
import '../widgets/user_transactions.dart';
import '../widgets/new_transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.amber, cardColor: Colors.white70)
            .copyWith(secondary: Colors.purple),
        // iconTheme: const IconThemeData(
        //   color: Colors.white,
        //   opacity: 0.5,
        // ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black87),
          headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.red),
          button: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.purpleAccent),
        ),
        appBarTheme: AppBarTheme(
          iconTheme:
              const IconThemeData(color: Colors.white, opacity: 0.8, size: 30),
          toolbarTextStyle: const TextTheme(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.red,
            ),
          ).bodyText2,
          titleTextStyle: const TextTheme(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.purple,
            ),
          ).headline6,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(
            onClick: (String title, double amount) {
              Navigator.of(context).pop();
              titleController.clear();
              amountController.clear();
            },
          );
        });
  }

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Personal Expenses'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add,
                    color: Theme.of(context).appBarTheme.iconTheme?.color),
                onPressed: () {}),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                // Container(
                //   color: Colors.amber,
                //   width: double.infinity,
                //   child: const Card(
                //     color: Colors.deepPurpleAccent,
                //     elevation: 5,
                //     child: Text('Chart'),
                //   ),
                // ),
                UserTransactions(),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,
              color: Theme.of(context).appBarTheme.iconTheme?.color),
          backgroundColor: Theme.of(context).colorScheme.primary,
          tooltip: "press to add new transaction",
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
