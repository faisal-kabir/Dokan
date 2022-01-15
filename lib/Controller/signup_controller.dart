import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wedevs/Dimension/dimension.dart';
import 'package:wedevs/Model/auth.dart';
import 'package:wedevs/Route/route.dart';
import 'package:wedevs/Theme/themes.dart';
import 'package:wedevs/URL/api_client.dart';
import 'package:wedevs/URL/app_constant.dart';
import 'package:wedevs/URL/url.dart';
import 'package:wedevs/Widgets/default_dialog.dart';
import 'package:wedevs/Widgets/show_message.dart';
import 'package:wedevs/main.dart';

class SignUpController extends GetxController{
  RxBool Loading=false.obs;
  Api_Client api_client=Api_Client();
  RxBool rememberMe=false.obs;
  RxBool obscureText=true.obs;
  RxBool conObscureText=true.obs;
  GlobalKey<FormState> formKey=GlobalKey();
  TextEditingController username=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController conPassword=TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    api_client.close();
  }

  requestLogin() async {
    if(!formKey.currentState!.validate()){
      return;
    }
    if(password.text!=conPassword.text){
      ErrorMessage(message: language.Password_and_conPassword_are_not_match);
      return;
    }
    Loading.value=true;
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(
          Uri.parse(URL.Register));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode({
        AppConstant.username: username.text,
        AppConstant.email: email.text,
        AppConstant.password: password.text
      })));
      HttpClientResponse response = await request.close();
      // todo - you should check the response.statusCode
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      Map data = json.decode(reply);
      if (data.containsKey('code')) {
        if (data['code'] == 406 || data['code'] == 400) {
          ErrorMessage(message: data[AppConstant.message]);
        } else if (data['code'] == 200) {
          await Get.dialog(
              DefaultDialog(
                  child: Column(
                    children: [
                      Text('${data[AppConstant.message]}\n${language
                          .Please_SignIn_your_Account}.',
                        style: Get.textTheme.bodyText1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Text(language.OK, style: TextStyle(
                                color: Themes.Primary,
                                fontSize: Dimension.Text_Size_Small,
                                fontWeight: Dimension.textBold),),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  title: language.Success
              )
          );
          Get.back();
        } else {
          ErrorMessage(message: data['code']);
        }
      }
    } catch (e) {
      ErrorMessage(message: language.Something_went_wrong);
    }
    Loading.value=false;
  }
}
