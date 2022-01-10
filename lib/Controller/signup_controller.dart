import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wedevs/Model/auth.dart';
import 'package:wedevs/Route/route.dart';
import 'package:wedevs/URL/api_client.dart';
import 'package:wedevs/URL/app_constant.dart';
import 'package:wedevs/URL/url.dart';
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
    await api_client.SimpleRequest(
        url: URL.Register,
        method: Method.POST,
        body: {
          AppConstant.username: username.text,
          AppConstant.email: email.text,
          AppConstant.password: password.text
        },
        onSuccess: (data){
          print(data['code']==400);
          if(data.containsKey('code') && data['code']==406){
            ErrorMessage(message: data[AppConstant.message]);
          } else {
            SuccessMessage(message: data[AppConstant.message],then: (){
              //Get.back();
            });
          }
        },
        onError: (data){
        }
    );
    Loading.value=false;
  }
}
