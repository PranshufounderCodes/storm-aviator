import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stormaviator/main.dart';
import 'package:stormaviator/model/user_model.dart';
import 'package:stormaviator/res/api_urls.dart';
import 'package:stormaviator/res/provider/user_view_provider.dart';
import 'package:http/http.dart' as http;
import 'package:stormaviator/view/auth/login_screen.dart';

class ProfileProvider with ChangeNotifier {
  dynamic id;
  dynamic mobileNo;
  dynamic email;
  dynamic userName;
  dynamic userImage;
  dynamic recharge;
  dynamic uId;
  dynamic mainWallet;
  dynamic thirdPartyWallet;
  dynamic totalWallet;
  dynamic winningAmount;
  dynamic lastLoginTime;
  dynamic apkLink;
  dynamic referralCodeUrl;
  dynamic minimumWithdraw;
  dynamic maximumWithdraw;
  dynamic aviatorLink;
  dynamic aviatorEventName;
  dynamic usdtDepositConversionRate;
  dynamic usdtWithdrawConversionRate;

  UserViewProvider userProvider = UserViewProvider();

  void fetchProfileData() async {
    try {
      UserModel user = await userProvider.getUser();
      String token = user.id.toString();
      final url = Uri.parse(ApiUrl.profile + token);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        id = responseData["id"];
        mobileNo = responseData["mobile"];
        email = responseData["email"];
        userName = responseData["username"];
        userImage = responseData["userimage"];
        recharge = responseData["recharge"];
        uId = responseData["u_id"];
        mainWallet = responseData["main_wallet"];
        thirdPartyWallet = responseData["third_party_wallet"];
        totalWallet = responseData["total_wallet"];
        winningAmount = responseData["winning_amount"];
        lastLoginTime = responseData["last_login_time"];
        apkLink = responseData["apk_link"];
        referralCodeUrl = responseData["referral_code_url"];
        minimumWithdraw = responseData["minimum_withdraw"];
        maximumWithdraw = responseData["maximum_withdraw"];
        aviatorLink = responseData["aviator_link"];
        aviatorEventName = responseData["aviator_event_name"];
        usdtDepositConversionRate = responseData["usdt_deposit_conversion_rate"];
        usdtWithdrawConversionRate = responseData["usdt_withdraw_conversion_rate"];
        if (kDebugMode) {
          print(responseData);
          print('Profile API data refreshed');
        }
        notifyListeners();
      } else if (response.statusCode == 401) {
        navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else {
        throw Exception("Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Failed to load data: $e");
      }
    }
  }
}
