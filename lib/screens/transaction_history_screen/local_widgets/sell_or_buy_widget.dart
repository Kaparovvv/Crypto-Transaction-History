import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fox_fit_app/commons/theme_helper.dart';

class SellOrBuyWidget extends StatefulWidget {
  final bool isSell;
  final Function() onTap;
  const SellOrBuyWidget({
    super.key,
    required this.isSell,
    required this.onTap,
  });

  @override
  State<SellOrBuyWidget> createState() => _SellOrBuyWidgetState();
}

class _SellOrBuyWidgetState extends State<SellOrBuyWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(),
      child: Container(
        width: 28.5.w,
        height: 28.5.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.5.w,
            color: widget.isSell ? ThemeHelper.purple : ThemeHelper.green,
          ),
        ),
        child: Icon(
          widget.isSell ? Icons.remove : Icons.add,
          color: widget.isSell ? ThemeHelper.purple : ThemeHelper.green,
        ),
      ),
    );
  }
}
