import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Privacy Policy", centerTitle: true, isTrailingEnabled: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '1. We collect your GPS location to provide accurate parking spot recommendations and navigation services.\n\n2. When you make a payment, we collect payment details such as credit card information securely.\n\n3. We may collect your name, email, and phone  number for account creation and communication.\n\n4. If required, we may collect details about your vehicle, such as license plate number, for parking reservations.')
          ],
        ),
      ),
    );
  }
}
