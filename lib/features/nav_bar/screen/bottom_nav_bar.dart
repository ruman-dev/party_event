import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/utils/app_colors.dart';
import 'package:party_event/core/utils/asset_path.dart';
import 'package:party_event/features/favorites/screen/favourite_screen.dart';
import 'package:party_event/features/notifications/screen/notification_screen.dart';
import 'package:party_event/features/organizer/presentaion/screen/earnings.dart';
import 'package:party_event/features/organizer/presentaion/screen/myListings.dart';
import 'package:party_event/features/organizer/presentaion/screen/organizerProfile.dart';
import 'package:party_event/features/profile/presentation/screen/profile_screen.dart';
import '../../home/screen/home.dart';
import '../../my_booking/screens/my_booking_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    super.key,
    required this.isOrganizer,
  });

  final RxInt _selectedIndex = 0.obs;

  final List<String> userSelectedItem = [
    AssetPath.homeIcon,
    AssetPath.favouriteIcon,
    AssetPath.calendarIcon,
    AssetPath.profileIcon,
  ];

  final List<String> userUnselectedItem = [
    AssetPath.homeIcon,
    AssetPath.favouriteIcon,
    AssetPath.calendarIcon,
    AssetPath.profileIcon,
  ];

  final List<String> organizerSelectedItem = [
    AssetPath.homeIcon,
    AssetPath.notification1,
    AssetPath.earnings,
    AssetPath.profileIcon,
  ];

  final List<String> organizerUnselectedItem = [
    AssetPath.homeIcon,
    AssetPath.notification1,
    AssetPath.earnings,
    AssetPath.profileIcon,
  ];

  RxBool isOrganizer;

  final List<Widget> _userScreens = [
    Home(),
    FavouriteScreen(),
    MyBookingScreen(),
    ProfileScreen()
  ];

  final List<Widget> _organizerScreens = [
    Mylistings(),
    NotificationScreen(),
    Earnings(),
    Organizerprofile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return isOrganizer.value
              ? _organizerScreens[_selectedIndex.value]
              : _userScreens[_selectedIndex.value];
        },
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex.value,
            onTap: (index) {
              _selectedIndex.value = index;
            },
            selectedItemColor: AppColors.selectedItemColor,
            unselectedItemColor: AppColors.secondaryColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: GoogleFonts.inter(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor),
            items: List.generate(4, (index) {
              return BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 2.5.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: _selectedIndex.value == index
                            ? AppColors.selectedItemColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    // Icon
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        _selectedIndex.value == index
                            ? AppColors.selectedItemColor
                            : AppColors.secondaryColor,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset(
                        isOrganizer.value
                            ? _selectedIndex.value == index
                                ? organizerSelectedItem[index]
                                : organizerUnselectedItem[index]
                            : _selectedIndex.value == index
                                ? userSelectedItem[index]
                                : userUnselectedItem[index],
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ],
                ),
                label: isOrganizer.value
                    ? _organizerLabel(index)
                    : _userLabel(index),
              );
            }),
          );
        },
      ),
    );
  }

  String _userLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Favorites';
      case 2:
        return 'My Bookings';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }

  String _organizerLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Notification';
      case 2:
        return 'Earnings';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }
}
