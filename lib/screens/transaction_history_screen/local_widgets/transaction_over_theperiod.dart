import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fox_fit_app/commons/text_style_helper.dart';
import 'package:fox_fit_app/commons/theme_helper.dart';
import 'package:fox_fit_app/models/transaction_history_model.dart';
import 'package:fox_fit_app/screens/transaction_history_screen/local_widgets/transactionDataBox_widget.dart';

class TransactionOverThePeriod extends StatefulWidget {
  final String dateTransactions;
  final List<ListTransaction> listTransaction;
  const TransactionOverThePeriod({
    Key? key,
    required this.dateTransactions,
    required this.listTransaction,
  }) : super(key: key);

  @override
  State<TransactionOverThePeriod> createState() =>
      _TransactionOverThePeriodState();
}

class _TransactionOverThePeriodState extends State<TransactionOverThePeriod> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          height: 50.h,
          padding: EdgeInsets.only(
            left: 15.w,
            top: 15.h,
            bottom: 15.h,
          ),
          decoration: BoxDecoration(color: ThemeHelper.grey),
          child: Text(
            widget.dateTransactions,
            style: TextStyleHelper.f15w400,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: widget.listTransaction.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var data = widget.listTransaction[index];
            return TransactionDataBoxWidget(
              name: data.name,
              date: data.date,
              dot: data.dot,
              usd: data.usd,
              isBuy: data.isBuy,
              onTap: () {
                setState(() {
                  data.isBuy = !data.isBuy;
                });
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 5.h,
              color: ThemeHelper.divideColor,
            );
          },
        ),
      ],
    );
  }
}
