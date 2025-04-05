import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:party_event/core/utils/app_colors.dart';

class Options extends StatelessWidget {
  Options({
    super.key,
    required this.imagePath,
    required this.option,
    required this.onPressed,
    required this.isSelected,
    required this.isPaymentScreen,
    required this.isTrailingEnabled,
    this.fontSize,
  });

  final String imagePath;
  final String option;
  final double? fontSize;
  final void Function() onPressed;
  final bool isSelected;
  final bool isPaymentScreen;
  final bool isTrailingEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? Color(0xFF337617) : Color(0xFFE2E8F0),
          ),
          color: isSelected ? Color(0x66E8F9E1) : Color(0xFFFFFFFF),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: isSelected ? Color(0xFFFFFFFF) : Color(0x33E2E8F0),
                    shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    imagePath,
                    width: 20.w,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  option,
                  style: TextStyle(fontSize: fontSize ?? 16.sp),
                ),
              ),
              isTrailingEnabled == true
                  ? isPaymentScreen == false
                      ? Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.radio_button_off,
                          color: isSelected
                              ? Color(0xFF455AF7)
                              : Color(0xFFE2E8F0),
                          size: 25.sp,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1.5.w,
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : Color(0xFFE2E8F0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1.w),
                            child: Icon(
                              Icons.circle,
                              size: 14.r,
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : Colors.white,
                            ),
                          ),
                        )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
