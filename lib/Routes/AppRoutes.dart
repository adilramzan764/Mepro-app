import 'package:get/get.dart';
import 'package:mepro_app/Routes/RoutesName.dart';
import 'package:mepro_app/View/ForgetPassword/ForgetPasswordScreen.dart';
import 'package:mepro_app/View/InviteFriends/InviteFriends.dart';
import 'package:mepro_app/View/OnBoardingScreens/LetsStartScreen.dart';
import 'package:mepro_app/View/OnBoardingScreens/OnboardingScreen_1.dart';
import 'package:mepro_app/View/SignIn/SignInScreen.dart';
import 'package:mepro_app/View/SignUp/SignUpScreen.dart';
import 'package:mepro_app/View/SplashScreen/SplashScreen.dart';

import '../View/AccountSecurityScreen/AccountSecurityScreen.dart';
import '../View/AppAppearance/AppAppearanceScreen.dart';
import '../View/AppAppearance/LanguageSelectionScreen.dart';
import '../View/BuyPoints/BuyPointsScreen.dart';
import '../View/CashingPoints/CashingPoints.dart';
import '../View/CashingPoints/ReviewSummaryScreen.dart';
import '../View/DailyDiamond/DailyDiamomdScreen.dart';
import '../View/ForgetPassword/NewPasswordScreen.dart';
import '../View/ForgetPassword/OTPCodeScreen.dart';
import '../View/Help&Support/Help&SupportScreen.dart';
import '../View/HomeScreen/HomeScreen.dart';
import '../View/LinkedAccounts/LinkedAccountsScreen.dart';
import '../View/MeproTierScreen/MeproTierScreen.dart';
import '../View/MyProfileScreen/MyProfileScreen.dart';
import '../View/Notification/NotificationScreen.dart';
import '../View/NotificationSettings/NotificationSettings_Screen.dart';
import '../View/PaymentMethod/AddNewPayment.dart';
import '../View/PaymentMethod/PaymentMethodsScreen.dart';
import '../View/Promo&Rewads/Promo&RewadsScreen.dart';
import '../View/QRScanner/ManuallyCodeScreen.dart';
import '../View/QRScanner/QRScannerScreen.dart';
import '../View/ReceipPhototScreen/ReceiptPhotoScreen.dart';
import '../View/ReceipPhototScreen/SelectReceiptScreen.dart';
import '../View/SelectPaymentMethod/SelectPaymentMethod.dart';
import '../View/Survey/SurveyDetailsScreen.dart';
import '../View/Survey/SurveyScreen.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: RoutesName.onBoardingScreen_1,
      page: () => OnboardingScreen_1(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.letsStartScreen,
      page: () => LetsStartScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.signUpscreen,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.signInscreen,
      page: () => SignInScreen(),
      transition: Transition.rightToLeft,

    ),
    GetPage(
      name: RoutesName.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.oTPCodeScreen,
      page: () => OTPCodeScreen(),
      transition: Transition.rightToLeft,
    ),GetPage(
      name: RoutesName.newPasswordScreen,
      page: () => NewPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: RoutesName.dailyDiamondScreen,
      page: () => DailyDiamondScreen(),
      transition: Transition.rightToLeft,
    )
    ,GetPage(
      name: RoutesName.meproTierScreen,
      page: () => MeproTierScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.myProfileScreen,
      page: () => MyProfileScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.notificationSettings_Screen,
      page: () => NotificationSettings_Screen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.accountSecurityScreen,
      page: () => AccountSecurityScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.linkedAccountsScreen,
      page: () => LinkedAccountsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.paymentMethodsScreen,
      page: () => PaymentMethodsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.addNewPaymentScreen,
      page: () => AddNewPaymentScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.appAppearanceScreen,
      page: () => AppAppearanceScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.languageSelectionScreen,
      page: () => LanguageSelectionScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.helpSupportScreen,
      page: () => HelpSupportScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.receiptPhotoScreen,
      page: () => ReceiptPhotoScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.selectReceiptScreen,
      page: () => SelectReceiptScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.surveyScreen,
      page: () => SurveyScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.surveyDetailsScreen,
      page: () => SurveyDetailsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.qRScannerScreen,
      page: () => QRScannerScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.enterCodeManuallyScreen,
      page: () => EnterCodeManuallyScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.buyPointsScreen,
      page: () => BuyPointsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.selectPaymentMethodScreen,
      page: () => SelectPaymentMethodScreen(
        amount: Get.arguments['amount'], // Get from route arguments
        points: Get.arguments['points'], // Get from route arguments
        isCashingPointsScreen: Get.arguments['isCashingPointsScreen'] ?? false, // Get from route arguments
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.inviteFriendsScreen,
      page: () => InviteFriendsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.cashingPointsScreen,
      page: () => CashingPointsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.reviewSummaryScreen,
      page: () => ReviewSummaryScreen(
          pointsAmount: Get.arguments['pointsAmount'], // Get from route arguments
          cashingAmount: Get.arguments['cashingAmount'], // Get from route arguments
          cardNumber: Get.arguments['cardNumber'], // Get from route arguments
        cardIcon: Get.arguments['cardIcon'], // Get from route arguments
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.promoRewadsScreen,
      page: () => PromoRewadsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.notificationScreen,
      page: () => NotificationScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
