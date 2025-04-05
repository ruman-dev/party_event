import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/global_widget/showDialog.dart';
import '../../../../core/helper/from_validator.dart';
import '../../../../core/utils/asset_path.dart';
import '../../controller/auth_controller.dart';
import '../../controller/reset_controller/reset_controller.dart';

class SingupVerify extends StatelessWidget {
  SingupVerify({super.key});

  final otpFormKey = GlobalKey<FormState>();
  final AuthController authenticationController = Get.put(AuthController());
  final ResetController resetController = Get.put(ResetController());
  final RxDouble secondsRemaining = 0.43.obs;
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0.0) {
        secondsRemaining.value -= 0.01;
      } else {
        secondsRemaining.value = 0.0;
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    startTimer();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: Image.asset(AssetPath.appleadin),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: otpFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Verification Code",
                  style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A202C)),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter the verification code that we\n have sent to your email",
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF718096C)),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Pinput(
                length: 4,
                keyboardType: TextInputType.number,
                controller: resetController.resetOtp,
                validator: FormValidation.validatePin,
                defaultPinTheme: PinTheme(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  textStyle: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF120D26),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1.w,
                    ),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  height: 60,
                  width: 60,
                  textStyle: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE2E8F0)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF337617),
                      width: 1.w,
                    ),
                  ),
                ),
                onCompleted: (value) {
                  // otpController.otpController.text = value;
                  // errorMessage.value = '';
                },
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    // errorMessage.value = '';
                  }
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomBtn(
                  text: "Continue",
                  onPressed: () {
                    if (otpFormKey.currentState!.validate()) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(0.0),
                            content: ShowDialog(),
                          );
                        },
                      );
                    }
                  }),
              SizedBox(
                height: 20.h,
              ),
              Obx(() {
                return Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      if (secondsRemaining.value == 0.0) {
                        secondsRemaining.value = 0.43;
                        startTimer();
                      }
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Re-send code in ",
                            style: TextStyle(
                                color: const Color(0xFF1A202C),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                          ),
                          TextSpan(
                            text: secondsRemaining.value == 0.0
                                ? ""
                                : "${secondsRemaining.value.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: const Color(0xFF4EB323)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
