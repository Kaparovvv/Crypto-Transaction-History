import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fox_fit_app/commons/text_style_helper.dart';
import 'package:fox_fit_app/commons/theme_helper.dart';
import 'package:fox_fit_app/screens/transaction_history_screen/local_widgets/sell_or_buy_widget.dart';

class TransactionDataBoxWidget extends StatelessWidget {
  final String? name;
  final String? date;
  final String? dot;
  final String? usd;
  final bool isBuy;
  final Function() onTap;

  const TransactionDataBoxWidget({
    Key? key,
    required this.name,
    required this.date,
    required this.dot,
    required this.usd,
    required this.isBuy,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 86.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 17.w,
                  top: 22.h,
                  bottom: 34.h,
                ),
                child: SellOrBuyWidget(
                  isSell: isBuy,
                  onTap: () => onTap(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 28.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        name ?? 'unknown',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleHelper.f16w400
                            .copyWith(color: ThemeHelper.black),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      date ?? '00/00/0000',
                      style: TextStyleHelper.f10w400,
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 27.h,
              bottom: 14.h,
              right: 18.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  isBuy ? '- ${dot ?? '0.00'} DOT' : '+ ${dot ?? '0.00'} BTC',
                  style: TextStyleHelper.f15w400,
                ),
                SizedBox(height: 4.h),
                Text(
                  isBuy ? '- \$${usd ?? "0.00"} USD' : '+ \$${usd ?? "0.00"}',
                  style: TextStyleHelper.f15w400,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
