import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {
  // var selectedDate = "12/25/1992".obs; // Default Date
  //
  // void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   if (args.value is DateTime) {
  //     selectedDate.value = formatDate(args.value);
  //   } else if (args.value is PickerDateRange) {
  //     DateTime? startDate = args.value.startDate;
  //     DateTime? endDate = args.value.endDate;
  //     if (startDate != null && endDate != null) {
  //       selectedDate.value = "${formatDate(startDate)} - ${formatDate(endDate)}";
  //     }
  //   }
  // }
  //
  // String formatDate(DateTime date) {
  //   return "${date.month}/${date.day}/${date.year}";
  // }
  //
  // void openDatePicker(BuildContext context) {
  //   Get.dialog(
  //     AlertDialog(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //       content: SizedBox(
  //         height: 350.h,
  //         width: 300.w,
  //         child: SfDateRangePicker(
  //           onSelectionChanged: onSelectionChanged,
  //           selectionMode: DateRangePickerSelectionMode.single,
  //           initialSelectedDate: DateTime.now(),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  var selectedDate = DateTime.now().obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  String formattedDate() {
    return DateFormat('MM/dd/yyyy').format(selectedDate.value);
  }
}
