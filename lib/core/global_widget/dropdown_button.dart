import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownButton extends StatelessWidget {
  final double? width;
  final Widget? image;
  final String? hintText;
  final String selectedValue;
  final List<String> items;
  final Function(String?) onChanged;
  final RxBool star;
  final RxBool showLabel;
  final TextStyle? textStyle;

  CustomDropdownButton(
      {super.key,
      this.hintText,
      required this.selectedValue,
      this.textStyle,
      required this.items,
      required this.onChanged,
      required this.image,
      this.width,
      required this.star,
      required this.showLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE2E8F0), width: 2.w),
            borderRadius: BorderRadius.circular(10.r),
            color: Color(0xFFFFFFFF),
          ),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.r),
                  filled: false,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                ),
                dropdownColor: Colors.white,
                value: selectedValue,
                items: items.map((String gender) {
                  return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(
                        gender,
                        style: textStyle ??
                            GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF4A5568),
                            ),
                      ));
                }).toList(),
                onChanged: onChanged,
                icon: image,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
