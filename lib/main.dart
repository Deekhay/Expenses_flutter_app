// ignore_for_file: prefer_const_constructors
// theme.copyWith(
//         colorScheme: theme.colorScheme.copyWith(secondary: myColor),
//         primaryColor: Colors.green

import 'package:expenses_app/widgets/new_transactions.dart';
import 'package:expenses_app/widgets/transactions_list.dart';
import 'package:flutter/material.dart';
import 'models/transactions.dart';
import 'widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = ThemeData();
    // Color myColor = Theme.of(context).colorScheme.secondary;

    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Quicksand',
        textTheme:
            ThemeData.light().textTheme.copyWith(titleMedium: TextStyle()),
        // appBarTheme: AppBarTheme(
        //     toolbarTextStyle: TextStyle(
        //   fontFamily: 'Open Sans',
        //   fontSize: 20,
        //   fontWeight: FontWeight.bold,
        // )),
        // colorScheme: ColorScheme(
        //     brightness: Brightness.light,
        //     primary: Colors.cyan,
        //     onPrimary: Colors.black,
        //     secondary: Colors.green,
        //     onSecondary: Colors.brown,
        //     error: Colors.grey,
        //     onError: Colors.black,
        //     background: Colors.purple,
        //     onBackground: Colors.blue,
        //     surface: Colors.orange,
        //     onSurface: Colors.pink)
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // const MyHomePage({super.key});
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  Iterable<Transaction> get _recentTransactions {
    //where is a list method used for creating a new list
    //based on a condition.
    return _userTransactions.where((tx) {
      //isAfter - date method used to compare two dates,
      //checking if the first date is after the second
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    });
  }

  void _addTransactions(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  final List<Transaction> transactions = [];

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        // backgroundColor: Colors.black,
        builder: (_) {
          return NewTransactions(_addTransactions);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses',
            style: TextStyle(
              // fontFamily: 'Open Sans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        actions: [
          IconButton(
            onPressed: () => startAddNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            color: Theme.of(context).primaryColor,
            child: SizedBox(
                width: double.infinity,
                child: Chart(recentTransactions: _userTransactions)),
          ),
          TransactionList(_userTransactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () => startAddNewTransaction(context),
          child: Icon(Icons.add)),
    );
  }
}
