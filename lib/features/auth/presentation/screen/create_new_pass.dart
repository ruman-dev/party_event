import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/core/routes/app_route.dart';
import '../../../../core/global_widget/custom_text_field.dart';
import '../../../../core/helper/from_validator.dart';
import '../../../../core/utils/asset_path.dart';
import '../../controller/auth_controller.dart';

class CreateNewPass extends StatelessWidget {
  CreateNewPass({super.key});

  final newPassFormKey = GlobalKey<FormState>();
  final AuthController authenticationController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: Image.asset(AssetPath.appleadin),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: newPassFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create New Password",
                style: GoogleFonts.inter(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A202C)),
              ),
              Text(
                "Enter the verification code that we have sent to your email",
                style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF718096C)),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                validator: FormValidation.validatePassword,
                textEditingController: authenticationController.newPassword,
                prefixIcon: Icon(
                  Icons.lock_outline,
                  size: 25.h,
                ),
                prefiesIcnColor: Color(0xFF718096),
                isPassword: true,
                hintText: "New Password",
                hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xFF718096)),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                textEditingController: authenticationController.newConfirmPass,
                validator: (value) => FormValidation.validatePasswordMatch(
                    value, authenticationController.newPassword),
                textInputAction: TextInputAction.done,
                prefixIcon: Icon(
                  Icons.lock_outline,
                  size: 25.h,
                ),
                prefiesIcnColor: Color(0xFF718096),
                isPassword: true,
                hintText: "Confirm password",
                hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xFF718096)),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomBtn(
                  text: "Reset Password",
                  onPressed: () {
                    if (newPassFormKey.currentState!.validate()) {
                      Get.toNamed(AppRoute.successPass);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
