import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fox_fit_app/commons/icon_helper.dart';
import 'package:fox_fit_app/commons/text_style_helper.dart';
import 'package:fox_fit_app/commons/theme_helper.dart';
import 'package:fox_fit_app/commons/widget_helper.dart';
import 'package:fox_fit_app/screens/transaction_history_screen/bloc/transaction_history_bloc.dart';
import 'package:fox_fit_app/screens/transaction_history_screen/local_widgets/calendar_dialog_box.dart';
import 'package:fox_fit_app/screens/transaction_history_screen/local_widgets/drop_down_widget.dart';
import 'package:fox_fit_app/screens/transaction_history_screen/local_widgets/list_transaction_history_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  late TransactionHistoryBloc _historyBloc;

  final List<String> _cryptoList = [
    'Crypto',
    'Bitcoin',
    'Etherium',
    'DodgeCoin',
  ];

  final List<String> _cryptoSells = [
    'Crypto Sells',
    'Crypto Sell',
    'Crypto Sel',
    'Crypto Se',
  ];

  @override
  void initState() {
    _historyBloc = TransactionHistoryBloc();
    _historyBloc.add(GetTransactionHistoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeHelper.color18181C,
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {},
              child: WidgetHelper().imageIcon(
                IconHelper.arrowBack,
                ThemeHelper.white,
                26,
              ),
            ),
            SizedBox(width: 6.w),
            Text(
              'Transaction History',
              style: TextStyleHelper.f16w400,
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          children: [
            Container(
              width: 1.sw,
              height: 149.5.h,
              color: ThemeHelper.color18181C,
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                top: 6.5.h,
              ),
              child: Column(
                children: [
                  CustomDropDownWidget(
                    listOfItem: _cryptoList,
                    height: 69.5,
                    width: 344,
                    textStyle: TextStyleHelper.f35w400,
                  ),
                  SizedBox(height: 11.h),
                  Row(
                    children: [
                      CustomDropDownWidget(
                        listOfItem: _cryptoSells,
                        height: 49,
                        width: 285,
                        textStyle: TextStyleHelper.f16w400,
                      ),
                      SizedBox(width: 11.w),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CalendarDialogBox();
                            },
                          );
                        },
                        splashColor: ThemeHelper.purple,
                        child: Container(
                          width: 49.w,
                          height: 49.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: ThemeHelper.white20),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 15.w),
                            child: WidgetHelper().imageIcon(
                              IconHelper.calendar,
                              ThemeHelper.white,
                              17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BlocConsumer<TransactionHistoryBloc, TransactionHistoryState>(
              bloc: _historyBloc,
              listener: (context, state) {
                if (state is ErrorTransactionHistoryState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message!),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoadingTransactionHistoryState) {
                  return Center(
                    child: SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is LoadedTransactionHistoryState) {
                  return ListTransactionHistoryWidget(
                    results: state.historyModel.results,
                  );
                }
                return const Center(
                  child: Text('Eror'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
