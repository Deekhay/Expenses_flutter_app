import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  // const NewTransactions({super.key});
  final Function txAdd;

  const NewTransactions(this.txAdd, {super.key});

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final textController = TextEditingController();

  final amountController = TextEditingController();

  // void  AddTx(textController.text.toString(),double.parse(amountController.text)){
  void submitData() {
    final enteredTitle = textController.text.toString();
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.txAdd(enteredTitle, enteredAmount);

    //Modal dissappears once a transaction is entered.
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: textController,
                onSubmitted: (_) => submitData(),
                // onChanged: (val) {
                //   titleInput = textStuff.text;
                // },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount(\$)'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                // onChanged: (val2) {
                //   amountInput = amountStuff.text;
                // },
              ),
              TextButton(
                onPressed: submitData,
                //() {
                //   print(textController.text);
                //   print(amountController.text);
                // },
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
