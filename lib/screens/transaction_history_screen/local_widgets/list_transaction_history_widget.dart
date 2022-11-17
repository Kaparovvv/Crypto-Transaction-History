import 'package:flutter/material.dart';
import 'package:fox_fit_app/models/transaction_history_model.dart';
import 'package:fox_fit_app/screens/transaction_history_screen/local_widgets/transaction_over_theperiod.dart';

class ListTransactionHistoryWidget extends StatelessWidget {
  final List<Result>? results;
  const ListTransactionHistoryWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: results!.length,
        itemBuilder: (context, index) => TransactionOverThePeriod(
          dateTransactions: results![index].date!,
          listTransaction: results![index].listTransaction!,
        ),
      ),
    );
  }
}
