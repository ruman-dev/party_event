import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';

import '../../../../core/global_widget/custom_text_field.dart';
import '../../../../core/helper/from_validator.dart';
import '../../../../core/utils/asset_path.dart';
import '../../../auth/controller/auth_controller.dart';

class UserDetails extends StatelessWidget {
  UserDetails({super.key});

  final profilFormKey = GlobalKey<FormState>();
  final AuthController authenticationController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          title: 'Profile', isTrailingEnabled: false, centerTitle: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Form(
          key: profilFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      AssetPath.userProfile,
                      width: 200.w,
                    ),
                  ),
                  Positioned(
                    left: 210.h,
                    top: 110.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AssetPath.edit1,
                        height: 30.h,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Fullname",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Color(0xFF4A5568),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                textInputAction: TextInputAction.next,
                validator: FormValidation.validateUsername,
                textEditingController: authenticationController.singUpUserName,
                prefixIcon: Image.asset(
                  AssetPath.user,
                  height: 25.h,
                ),
                prefiesIcnColor: Color(0xFF718096),
                hintText: "Adam John Levine",
                hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xFF1A202C)),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Email",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Color(0xFF4A5568),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                validator: FormValidation.validateEmail,
                textEditingController: authenticationController.singUpEmail,
                textInputAction: TextInputAction.next,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  size: 25.sp,
                ),
                prefiesIcnColor: Color(0xFF718096),
                hintText: "Levineadame@mail.com",
                hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xFF1A202C)),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Password",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Color(0xFF4A5568),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                validator: FormValidation.validatePassword,
                textEditingController: authenticationController.singUpPassword,
                textInputAction: TextInputAction.done,
                prefixIcon: Image.asset(
                  AssetPath.lock,
                  height: 25.h,
                ),
                prefiesIcnColor: Color(0xFF718096),
                isPassword: true,
                hintText: "******",
                hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xFF1A202C)),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: CustomBtn(
                    text: 'Save Change',
                    onPressed: () {
                      // debugPrint('Selected Ticket Type: ${selectTicketType.value}\nSelected Seat: ${seatCount.value}');
                      // Get.toNamed(AppRoute.generateTicketScreen);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
