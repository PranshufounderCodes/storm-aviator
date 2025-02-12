// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stormaviator/generated/assets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:stormaviator/model/user_model.dart';
import 'package:stormaviator/res/api_urls.dart';
import 'package:stormaviator/res/provider/user_view_provider.dart';
import 'package:stormaviator/view/home/dragon_tiger_new/widgets/Image_tost.dart';



class BetColorResultProviderTRX with ChangeNotifier {

  UserViewProvider userProvider = UserViewProvider();

  bool _regLoading = false;
  bool get regLoading =>_regLoading;
  setRegLoading(bool value){
    _regLoading=value;
    notifyListeners();
  }
  Future ColorbetTRX(context, String amount, String number,int gameid) async {
    UserModel user = await userProvider.getUser();
    String token = user.id.toString();
    setRegLoading(true);
    final response = await http.post(Uri.parse(ApiUrl.profile),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "userid":token,
        "amount":amount,
        "gameid":gameid.toString(),
        "number": number

      }),
    );
    if (response.statusCode == 200) {
      setRegLoading(false);
      Navigator.pop(context);
      return  ImageToast.show(imagePath: Assets.imagesBetSucessfull, context: context,height: 200,width: 200);
    } else {
      setRegLoading(false);
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return Fluttertoast.showToast(msg: responseData['msg']);
    }
  }
}