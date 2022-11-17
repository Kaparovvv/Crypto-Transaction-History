import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fox_fit_app/commons/text_style_helper.dart';
import 'package:fox_fit_app/commons/theme_helper.dart';

class CustomDropDownWidget extends StatefulWidget {
  final double width;
  final double height;
  final List<String> listOfItem;
  final TextStyle textStyle;

  const CustomDropDownWidget({
    super.key,
    required this.listOfItem,
    required this.width,
    required this.height,
    required this.textStyle,
  });

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  String? _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.w,
      height: widget.height.h,
      decoration: BoxDecoration(
        border: Border.all(color: ThemeHelper.white20),
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 11.h,
        horizontal: 16.w,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const Icon(Icons.expand_more),
          iconSize: 13,
          iconEnabledColor: ThemeHelper.white,
          dropdownColor: Colors.grey.shade600,
          style: TextStyleHelper.f35w400,
          hint: Text(
            widget.listOfItem.first,
            style: widget.textStyle,
          ),
          value: _selectedLocation,
          onChanged: (newValue) {
            setState(() {
              _selectedLocation = newValue;
            });
          },
          items: widget.listOfItem.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: widget.textStyle,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
