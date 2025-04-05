import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/utils/app_colors.dart';
import 'package:party_event/features/organizer/controller/earnings_controller.dart';

class Earnings extends StatelessWidget {
  Earnings({super.key});

  final EarningsController earningsController = Get.put(EarningsController());

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Earnings Overview',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkBlueGrey,
          ),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.03),
              Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0x33718096)),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.1.w,
                      vertical: Get.height * 0.04.h,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Total Revenue",
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkBlueGrey,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "\$3500.00",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 32.sp,
                            color: Color(0xFF337617),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.06),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0x33718096)),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.01,
                    vertical: Get.height * 0.01,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Overview",
                              style: GoogleFonts.inter(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkBlueGrey,
                              ),
                            ),
                            Obx(
                              () => Container(
                                height: Get.height * 0.04,
                                width: Get.width * 0.28,
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                decoration: BoxDecoration(
                                  color: Color(0xFFD2F3C3),
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: earningsController
                                        .earningsSelectedValue.value,
                                    isExpanded: true,
                                    icon: Icon(Icons.arrow_drop_down,
                                        color: Colors.black),
                                    items: earningsController
                                        .earningsSelectedItems
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              value,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      earningsController.earningsSelectedValue
                                          .value = newValue!;
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: Get.pixelRatio * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 18,
                                left: 12,
                                top: 24,
                                bottom: 12,
                              ),
                              child: LineChart(
                                mainData(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            height: 34,
                            child: TextButton(
                              onPressed: () {
                                showAvg = !showAvg;
                              },
                              child: Text(
                                'avg',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: showAvg
                                      ? Colors.white.withValues(alpha: 0.5)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  List<String> days = ['Sat', 'Sun', 'Mon', 'Tues', 'Wed', 'Thu', 'Fri'];

  Widget text = (value.toInt() >= 0 && value.toInt() < days.length)
      ? Text(days[value.toInt()],
          style: GoogleFonts.inter(
            color: Color(0xFF718096),
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ))
      : Text('',
          style: GoogleFonts.inter(
            color: Color(0xFF718096),
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ));

  return SideTitleWidget(
    meta: meta,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  List<String> numbers = ['400', '600', '800', '1000', '1200'];
  Widget totalNumbers = (value.toInt() >= 0 && value.toInt() < numbers.length)
      ? Text(numbers[value.toInt()],
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            color: Color(0xFF718096),
            fontSize: 14.sp,
          ))
      : Text('',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            color: Color(0xFF718096),
            fontSize: 14.sp,
          ));

  return SideTitleWidget(
    meta: meta,
    child: totalNumbers,
  );
}

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
      drawHorizontalLine: true,
      horizontalInterval: 1,
      // Keep interval at 1 for equal spacing
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return const FlLine(
          color: Color(0xFFF1F1F5),
          strokeWidth: 1.5,
        );
      },
      getDrawingVerticalLine: (value) {
        return const FlLine(
          color: AppColors.secondaryColor,
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: Get.width * 0.07,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: Get.height * 0.06,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: 0,
    maxX: 6,
    minY: -1,
    maxY: 5,
    // Increased to 6 to align with 5 labels
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3),
          FlSpot(1, 2),
          FlSpot(2, 5),
          FlSpot(3, 3.1),
          FlSpot(4, 4),
          FlSpot(5, 3),
          FlSpot(6, 4),
        ],
        isCurved: true,
        color: Color(0xFF74DB47),
        barWidth: 3.5,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
      ),
    ],
  );
}
