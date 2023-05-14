import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

typedef DelFunc = void Function(String);

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final DelFunc deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 243, 208),
      height: 450,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'No transacations added yet',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color.fromRGBO(76, 0, 138, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 27),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.network(
                          'https://media.giphy.com/media/PcEHGN6WvTO2ekGICI/giphy.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : ListView(
              children: transactions
                  .map((tx) => TransactionItem(
                        key: ValueKey(tx.id),
                        transaction: tx,
                        deleteTx: deleteTx,
                      ))
                  .toList(),
            ),
    );
  }
}
