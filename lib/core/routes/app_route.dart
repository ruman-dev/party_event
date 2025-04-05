import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:party_event/features/all_featured_screen/screen/all_featured_screen.dart';
import 'package:party_event/features/auth/presentation/screen/create_new_pass.dart';
import 'package:party_event/features/auth/presentation/screen/forget.dart';
import 'package:party_event/features/auth/presentation/screen/login_screen.dart';
import 'package:party_event/features/auth/presentation/screen/organizer.dart';
import 'package:party_event/features/auth/presentation/screen/otp_screen.dart';
import 'package:party_event/features/auth/presentation/screen/singUp_verify.dart';
import 'package:party_event/features/auth/presentation/screen/singup_screen.dart';
import 'package:party_event/features/auth/presentation/screen/successPassword.dart';
import 'package:party_event/features/generate_ticket/presentation/screen/generate_ticket_screen.dart';
import 'package:party_event/features/home/screen/home.dart';
import 'package:party_event/features/map_view/presentation/screen/map_screen.dart';
import 'package:party_event/features/notifications/screen/notification_screen.dart';
import 'package:party_event/features/onboarding/presentation/screens/onboarding_screen_one.dart';
import 'package:party_event/features/organizer/presentaion/screen/creat_eventScreen.dart';
import 'package:party_event/features/organizer/presentaion/screen/even_details.dart';
import 'package:party_event/features/organizer/presentaion/screen/privacy_policy.dart';
import 'package:party_event/features/payment/presentation/screen/select_payment_method_screen.dart';
import 'package:party_event/features/popular_event/screen/popular_event_screen.dart';
import 'package:party_event/features/profile/presentation/screen/faqs.dart';
import 'package:party_event/features/profile/presentation/screen/profile_screen.dart';
import 'package:party_event/features/profile/presentation/screen/select_language.dart';
import 'package:party_event/features/profile/presentation/screen/user_details.dart';
import 'package:party_event/features/search_event/presentation/screen/search_event.dart';
import 'package:party_event/features/splash/screen/splash_screen.dart';
import 'package:party_event/features/time_based_flow/choose_event/presentation/screen/choose_event_screen.dart';
import 'package:party_event/features/time_based_flow/event_details/screen/time_event_details.dart';

import '../../features/balance/presentation/balance_screen.dart';
import '../../features/buy_ticket/presentation/screen/buy_ticket_screen.dart';

import '../../features/organizer/presentaion/screen/organizer_deatails.dart';
import '../../features/time_based_flow/voucher/screen/voucher_screen.dart';

class AppRoute {
  static String splashScreen = "/splashScreen";
  static String onBoardingScreen = "/onBoardingScreen";
  static String signInScreen = "/signInScreen";
  static String forget = "/forget";
  static String homeScreen = "/homeScreen";
  static String bottomNavBar = "/bottomNavBar";
  static String notificationScreen = "/notificationScreen";
  static String allFeaturedScreen = "/allFeaturedScreen";
  static String resetPassword = "/resetPassword";
  static String otpScreen = "/otpScreen";
  static String createNewPass = "/creatNewPass";
  static String successPass = "/successPass";
  static String orSignUpScreen = "/orSignUpScreen";
  static String singUpScreen = "/singUpScreen";
  static String singUpVerify = "/singUpVerify";
  static String popularEventScreen = "/popularEventScreen";
  static String searchEventScreen = "/searchEventScreen";
  static String mapScreen = "/mapScreen";
  static String choseEvent = "/choseEvent";

  // static String eventDetailsScreen = "/eventDetailsScreen";
  static String ticketScreen = "/ticketScreen";
  static String se = "/searchEventScreen";
  static String profile = "/profile";
  static String userDetails = "/userDetails";
  static String selectLanguage = "/selectLanguage";
  static String faqs = "/faqs";
  static String selectPaymentMethodScreen = "/selectPaymentMethodScreen";
  static String organizer = "/organizer";
  static String evenDetails = "/evenDetails";
  static String balanceScreen = "/balanceScreen";
  static String createEvent = "/createEvent";
  static String generateTicketScreen = "/generateTicketScreen";
  static String voucherScreen = "/voucherScreen";
  static String timeEventDetailsScreen = "/timeEventDetailsScreen";
  static String organizerDetails = "/OrganizerDetails";
  static String privacyPolicy = "/privacyPolicy";

  static List<GetPage> route = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onBoardingScreen, page: () => OnboardingView()),
    GetPage(name: signInScreen, page: () => LoginScreen()),
    GetPage(name: forget, page: () => Forget()),
    GetPage(name: onBoardingScreen, page: () => OnboardingView()),
    GetPage(name: homeScreen, page: () => Home()),
    // GetPage(name: bottomNavBar, page: () => BottomNavBar(isOrganizer: null,)),
    GetPage(name: notificationScreen, page: () => NotificationScreen()),
    GetPage(name: allFeaturedScreen, page: () => AllFeaturedScreen()),
    GetPage(name: otpScreen, page: () => OtpScreen()),
    GetPage(name: createNewPass, page: () => CreateNewPass()),
    GetPage(name: successPass, page: () => SuccessPassword()),
    GetPage(name: orSignUpScreen, page: () => Organizer()),
    GetPage(name: singUpScreen, page: () => SingupScreen()),
    GetPage(name: singUpVerify, page: () => SingupVerify()),
    GetPage(name: popularEventScreen, page: () => PopularEventScreen()),
    GetPage(name: searchEventScreen, page: () => SearchEvent()),
    GetPage(name: mapScreen, page: () => MapScreen()),
    // GetPage(name: eventDetailsScreen, page: () => HomeEventScreen()),
    GetPage(name: ticketScreen, page: () => BuyTicketScreen()),
    GetPage(name: profile, page: () => ProfileScreen()),
    GetPage(name: userDetails, page: () => UserDetails()),
    GetPage(name: selectLanguage, page: () => SelectLanguage()),
    GetPage(name: faqs, page: () => Faqs()),
    GetPage(name: evenDetails, page: () => EventDetails()),
    GetPage(
        name: selectPaymentMethodScreen,
        page: () => SelectPaymentMethodScreen()),
    GetPage(name: balanceScreen, page: () => BalanceScreen()),
    GetPage(name: createEvent, page: () => CreatEventscreen()),
    GetPage(name: generateTicketScreen, page: () => GenerateTicketScreen()),
    GetPage(name: voucherScreen, page: () => VoucherScreen()),
    GetPage(name: timeEventDetailsScreen, page: () => TimeEventDetails()),
    GetPage(name: organizerDetails, page: () => OrganizerDeatails()),
    GetPage(name: privacyPolicy, page: () => PrivacyPolicy()),
    GetPage(name: choseEvent, page: () => ChooseEventScreen())
  ];
}
