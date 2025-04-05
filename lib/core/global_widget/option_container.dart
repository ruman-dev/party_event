// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class OptionContainer extends StatelessWidget {
//   final String title;
//   final String imagePath;
//
//   final RxBool isSelected = false.obs;
//    OptionContainer({
//     Key? key,
//    required this.title,
//     required  this.imagePath,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
//       decoration: BoxDecoration(
//         color: isSelected.value == true ? Color(0xFF4EB323) : Colors.white,
//         borderRadius: BorderRadius.circular(12.r),
//         border: Border.all(
//           color: isSelected.value == true ? Color(0xFF4EB323) : Colors.grey.shade300,
//           width: 1.5,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Image.asset(
//                 imagePath,
//                 width: 24.w,
//                 height: 24.h,
//                 color: isSelected.value == true ? Colors.white : Colors.black,
//               ),
//               SizedBox(width: 12.w),
//               Text(
//                 title!,
//                 style: GoogleFonts.inter(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w600,
//                   color: isSelected.value == true? Colors.white : Colors.black,
//                 ),
//               ),
//             ],
//           ),
//           Icon(
//             isSelected.value == true ? Icons.radio_button_checked : Icons.radio_button_off,
//             color: isSelected.value == true ? Colors.white : Colors.grey,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionContainer extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color decoracolor;
  final Color borderColor;
  final Color imageColor;
  final Color textColor;
  final Icon icon;
  final Color iconColor;
  final VoidCallback onTap;

  final RxBool isSelected = false.obs;

  OptionContainer({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.decoracolor,
    required this.borderColor,
    required this.imageColor,
    required this.textColor,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: decoracolor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: borderColor,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath,
                  width: 24.w,
                  height: 24.h,
                  color: imageColor,
                ),
                SizedBox(width: 12.w),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ],
            ),
            Icon(
              icon.icon,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
