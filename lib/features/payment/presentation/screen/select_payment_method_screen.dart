import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/features/payment/controller/payment_method_controller.dart';
import 'package:party_event/features/payment/presentation/widget/payment_textfield.dart';

import '../../../../core/global_widget/custom_appbar.dart';
import '../../../../core/global_widget/custom_btn.dart';
import '../../../../core/routes/app_route.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/asset_path.dart';
import '../../../profile/presentation/widget/select_option.dart';

class SelectPaymentMethodScreen extends StatelessWidget {
  SelectPaymentMethodScreen({super.key});

  final RxList<Map<String, dynamic>> paymentMethodType = [
    {
      'image': AssetPath.appleIcon,
      'title': 'Apple Pay',
    },
    {
      'image': AssetPath.payPalIcon,
      'title': 'PayPal',
    },
    {
      'image': AssetPath.google,
      'title': 'Google Pay',
    },
  ].obs;

  RxInt selectedMethod = 0.obs;
  RxBool selectSavedCard = false.obs;
  RxBool isCardSaved = false.obs;

  final PaymentMethodController paymentMethodController =
      Get.put(PaymentMethodController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment', isTrailingEnabled: false),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 16.w),
                child: Text(
                  'Payment Method',
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkBlueGrey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.w, top: 16.w),
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      isScrollControlled: false,
                      isDismissible: true,
                      enableDrag: true,
                      // clipBehavior: Clip.antiAliasWithSaveLayer,
                      builder: (context) => SizedBox(
                        width: double.infinity,
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 10.h),
                              Container(
                                height: 4.h,
                                width: 42.w,
                                decoration: BoxDecoration(
                                  color: Color(0x33718096),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Card Number',
                                      style: GoogleFonts.inter(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF4A5568),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    PaymentTextfield(
                                      textEditingController:
                                          paymentMethodController
                                              .cardNumberController,
                                      hintText: '3571  399507  50832',
                                      validationMessage:
                                          'Card number is required',
                                    ),
                                    SizedBox(height: 16.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Expires End',
                                                style: GoogleFonts.inter(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF4A5568),
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              PaymentTextfield(
                                                textEditingController:
                                                    paymentMethodController
                                                        .expiryDateController,
                                                hintText: '06/23',
                                                validationMessage:
                                                    'Expiry date is required',
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'CVV',
                                                style: GoogleFonts.inter(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF4A5568),
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              PaymentTextfield(
                                                textEditingController:
                                                    paymentMethodController
                                                        .cvvController,
                                                hintText: '483',
                                                validationMessage:
                                                    'CVV is required',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.h),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.r),
                                        ),
                                        activeColor: AppColors.primaryColor,
                                        value: true,
                                        onChanged: (value) {
                                          value = !value!;
                                        }),
                                    Text(
                                      'Save as a primary card',
                                      style: GoogleFonts.inter(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 30.h),
                                child: CustomBtn(
                                    text: 'Continue',
                                    onPressed: () {
                                      // debugPrint('Selected Ticket Type: ${selectTicketType.value}\nSelected Seat: ${seatCount.value}');
                                      if (formKey.currentState!.validate()) {
                                        // Get.toNamed(AppRoute.bottomNavBar);
                                        // print('Card Number: ${paymentMethodController.cardNumberController.text}');
                                        isCardSaved.value = true;
                                        Get.back();
                                      }

                                      /// Save card details
                                      // print('Card Number: ${paymentMethodController.cardNumberController.text}');
                                      // Get.toNamed(AppRoute.selectPaymentMethodScreen);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Add New Card',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Expanded(
            flex: 7,
            child: ListView.builder(
              itemCount: paymentMethodType.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    child: Options(
                      imagePath: paymentMethodType[index]['image'],
                      option: paymentMethodType[index]['title'],
                      fontSize: 14.sp,
                      onPressed: () {
                        selectedMethod.value = index;
                        debugPrint(
                            "Selected language: ${paymentMethodType[index]['title']}");
                      },
                      isSelected: selectedMethod.value == index,
                      isPaymentScreen: true,
                      isTrailingEnabled: true,
                    ),
                  ),
                );
              },
            ),
          ),
          Obx(
            () => isCardSaved.value
                ? Expanded(
                    flex: 7,
                    child: Padding(
                        padding: EdgeInsets.only(left: 18.w),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1.5.w,
                                        color: selectSavedCard.value
                                            ? AppColors.primaryColor
                                            : Color(0xFFE2E8F0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(1.w),
                                      child: Icon(
                                        Icons.circle,
                                        size: 14.r,
                                        color: selectSavedCard.value
                                            ? AppColors.primaryColor
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16.w),
                                  child: Text(
                                    'Pay by Debit/ Credit Card',
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkBlueGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Obx(
                              () => Padding(
                                padding: EdgeInsets.only(
                                  right: 16.w,
                                ),
                                child: Options(
                                  imagePath: AssetPath.appleIcon,
                                  option: '•••• •••• •••• 0561',
                                  fontSize: 14.sp,
                                  onPressed: () {
                                    selectSavedCard.value =
                                        !selectSavedCard.value;
                                  },
                                  isSelected: selectSavedCard.value,
                                  isPaymentScreen: true,
                                  isTrailingEnabled: false,
                                ),
                              ),
                            ),
                          ],
                        )
                        // : SizedBox(),
                        ),
                  )
                : SizedBox(),
          ),

          /// Select Payment Method Screen
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: CustomBtn(
                text: 'Continue',
                onPressed: () {
                  if (selectSavedCard.value) {
                    Get.toNamed(AppRoute.generateTicketScreen);
                  }
                  // debugPrint('Selected Ticket Type: ${selectTicketType.value}\nSelected Seat: ${seatCount.value}');
                }),
          ),
        ],
      ),
    );
  }
}
