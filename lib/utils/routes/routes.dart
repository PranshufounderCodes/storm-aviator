import 'package:stormaviator/res/aap_colors.dart';
import 'package:stormaviator/utils/routes/routes_name.dart';
import 'package:stormaviator/view/account/History/betting_history.dart';
import 'package:stormaviator/view/account/gifts.dart';
import 'package:stormaviator/view/account/service_center/feedback.dart';
import 'package:stormaviator/view/auth/login_screen.dart';
import 'package:stormaviator/view/auth/register_otp.dart';
import 'package:stormaviator/view/auth/splash_screen_test.dart';
import 'package:stormaviator/view/bottom/bottom_nav_bar.dart';
import 'package:stormaviator/view/home/lottery/wingo/win_go.dart';
import 'package:stormaviator/view/home/mini/Aviator/Aviator/home_page_aviator.dart';
import 'package:stormaviator/view/wallet/add_bank_account.dart';
import 'package:stormaviator/view/wallet/deposit_history.dart';
import 'package:stormaviator/view/wallet/deposit_screen.dart';
import 'package:stormaviator/view/wallet/withdraw_screen.dart';
import 'package:stormaviator/view/wallet/withdrawal_history.dart';
import 'package:flutter/material.dart';
import '../../res/components/text_widget.dart';

class Routers {
  static WidgetBuilder generateRoute(String routeName) {
    switch (routeName) {
      case RoutesName.splashScreen:
        return (context) => const Splash();
    case RoutesName.bottomNavBar:
      return (context) => const BottomNavBar();
      case RoutesName.loginScreen:
        return (context) => const LoginScreen();
      // case RoutesName.registerScreen:
      //   return (context) => const RegisterScreen();
      case RoutesName.registerScreenOtp:
        return (context) => const RegisterScreenOtp();
      case RoutesName.depositScreen:
        return (context) => const DepositScreen();
      case RoutesName.withdrawScreen:
        return (context) =>  const WithdrawScreen();
      case RoutesName.addBankAccount:
        return (context) => const AddBankAccount();
      case RoutesName.depositHistory:
        return (context) => const DepositHistory();
      case RoutesName.withdrawalHistory:
        return (context) => const WithdrawHistory();
      case RoutesName.aviatorGame:
        return (context) => const GameAviator();
      case RoutesName.winGoScreen:
        return (context) => const WinGo();
      // case RoutesName.levelscreen:
      //   return (context) =>  LevelScreen();
      case RoutesName.Bethistoryscreen:
        return (context) => const BetHistory();

      case RoutesName.feedbackscreen:
        return (context) => const FeedbackPage();
      case RoutesName.giftsscreen:
        return (context) =>const GiftsPage();
      // case RoutesName.subscription:
      //   return (context) => const Subscription();
      default:
        return (context) => Scaffold(
              body: Center(
                child: textWidget(
                    text: 'No Route Found!',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryTextColor),
              ),
            );
    }
  }
}
