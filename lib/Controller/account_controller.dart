import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wedevs/URL/api_client.dart';
import 'package:wedevs/URL/url.dart';
import 'package:wedevs/main.dart';

class AccountController extends GetxController{
  RxBool Loading=false.obs;
  Api_Client api_client=Api_Client();
  GlobalKey<FormState> formKey=GlobalKey();
  TextEditingController email=TextEditingController();
  TextEditingController fullName=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController apartment=TextEditingController();
  TextEditingController zipCode=TextEditingController();

  @override
  void onInit() {
    super.onInit();
    email.text=auth!.userEmail!;
    fullName.text=auth!.userDisplayName!;
    address.text='465 Nolan Causeway Suite 079';
    apartment.text='Unit 512';
    zipCode.text='77017';
  }

  @override
  void onClose() {
    super.onClose();
    api_client.close();
  }



  Future getData() async {
    Loading.value=true;
    update();
    await api_client.Request(
        url: URL.Main_Url,
        onSuccess: (data){

        },
        onError: (data){
        }
    );
    Loading.value=false;
    update();
  }

  updateProfile() {
    if(!formKey.currentState!.validate()){
      return;
    }
  }
}
