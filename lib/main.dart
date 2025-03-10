import 'dart:io';
import 'package:stormaviator/model/colorPredictionResult_provider.dart';
import 'package:stormaviator/res/app_constant.dart';
import 'package:stormaviator/res/provider/TermsConditionProvider.dart';
import 'package:stormaviator/res/provider/aboutus_provider.dart';
import 'package:stormaviator/res/provider/addacount_controller.dart';
import 'package:stormaviator/res/provider/auth_provider.dart';
import 'package:stormaviator/res/provider/betColorPrediction_provider.dart';
import 'package:stormaviator/res/provider/betcolorpredictionTRX.dart';
import 'package:stormaviator/res/provider/contactus_provider.dart';
import 'package:stormaviator/res/provider/feedback_provider.dart';
import 'package:stormaviator/res/provider/giftcode_provider.dart';
import 'package:stormaviator/res/provider/plinko_bet_provider.dart';
import 'package:stormaviator/res/provider/privacypolicy_provider.dart';
import 'package:stormaviator/res/provider/profile_provider.dart';
import 'package:stormaviator/res/provider/slider_provider.dart';
import 'package:stormaviator/res/provider/user_view_provider.dart';
import 'package:stormaviator/utils/routes/routes.dart';
import 'package:stormaviator/utils/routes/routes_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stormaviator/view/home/lottery/wingo/controller/win_go_controller.dart';
import 'package:stormaviator/view/home/lottery/wingo/view_model/win_go_bet_view_model.dart';
import 'package:stormaviator/view/home/lottery/wingo/view_model/win_go_game_his_view_model.dart';
import 'package:stormaviator/view/home/lottery/wingo/view_model/win_go_my_his_view_model.dart';
import 'package:stormaviator/view/home/lottery/wingo/view_model/win_go_pop_up_view_model.dart';
import 'package:stormaviator/view/home/lottery/wingo/view_model/win_go_result_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stormaviator/view/kerala_lottery_result.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  setPathUrlStrategy();
  runApp(const MyApp());
}

double height = 0.0;
double width = 0.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width > 500
        ? 500
        : MediaQuery.of(context).size.width;
    WakelockPlus.enable();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserAuthProvider()),
        ChangeNotifierProvider(create: (context) => UserViewProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => AboutusProvider()),
        ChangeNotifierProvider(create: (context) => AddacountProvider()),
        ChangeNotifierProvider(create: (context) => GiftcardProvider()),
        ChangeNotifierProvider(create: (context) => ColorPredictionProvider()),
        ChangeNotifierProvider(create: (context) => BetColorResultProvider()),
        ChangeNotifierProvider(create: (context) => FeedbackProvider()),
        ChangeNotifierProvider(create: (context) => TermsConditionProvider()),
        ChangeNotifierProvider(create: (context) => PrivacyPolicyProvider()),
        ChangeNotifierProvider(create: (context) => ContactUsProvider()),
        ChangeNotifierProvider(
            create: (context) => BetColorResultProviderTRX()),
        ChangeNotifierProvider(create: (context) => PlinkoBetHistoryProvider()),
        //win go
        ChangeNotifierProvider(create: (context) => WinGoController()),
        ChangeNotifierProvider(create: (context) => WinGoGameHisViewModel()),
        ChangeNotifierProvider(create: (context) => WinGoMyHisViewModel()),
        ChangeNotifierProvider(create: (context) => WinGoPopUpViewModel()),
        ChangeNotifierProvider(create: (context) => WinGoBetViewModel()),
        ChangeNotifierProvider(create: (context) => WinGoResultViewModel()),
      ],
      child: Builder(
        builder: (context) {
          if (kIsWeb) {
            width = MediaQuery.of(context).size.width > 500
                ? 500
                : MediaQuery.of(context).size.width;
            return MaterialApp(
              navigatorKey: navigatorKey,
              builder: (context, child) {
                return Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: width,
                    ),
                    child: child,
                  ),
                );
              },
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.splashScreen,
              onGenerateRoute: (settings) {
                if (settings.name != null) {
                  return MaterialPageRoute(
                    builder: Routers.generateRoute(settings.name!),
                    settings: settings,
                  );
                }
                return null;
              },
            );
          } else {
            return MaterialApp(
              navigatorKey: navigatorKey,
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.splashScreen,
              // home:  KeralaLotteryResult(),
              onGenerateRoute: (settings) {
                if (settings.name != null) {
                  return MaterialPageRoute(
                    builder: Routers.generateRoute(settings.name!),
                    settings: settings,
                  );
                }
                return null;
              },
            );
          }
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}