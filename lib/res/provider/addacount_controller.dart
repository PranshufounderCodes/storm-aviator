// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:stormaviator/model/user_model.dart';
import 'package:stormaviator/res/api_urls.dart';
import 'package:stormaviator/res/provider/user_view_provider.dart';
import 'package:stormaviator/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class AddacountProvider with ChangeNotifier {

  UserViewProvider userProvider = UserViewProvider();

  bool _regLoading = false;
  bool get regLoading =>_regLoading;
  setRegLoading(bool value){
    _regLoading=value;
    notifyListeners();
  }
  Future Addacount(context, String name, String bankname,String accountno,String branch, String ifsc) async {
    UserModel user = await userProvider.getUser();
    String token = user.id.toString();
    setRegLoading(true);
    final response = await http.post(
      Uri.parse(ApiUrl.addacount),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
          {
        "user_id": token,
        "name":name,
        "account_number":accountno,
        "ifsc_code": ifsc,
        "bank_name": bankname,
        "branch":branch
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      setRegLoading(false);

      Navigator.pushReplacementNamed(context,  RoutesName.withdrawScreen);
      return Fluttertoast.showToast(msg: responseData['message']);
    } else {
      setRegLoading(false);
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return Fluttertoast.showToast(msg: responseData['message']);
    }
  }
}