import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wedevs/Dimension/dimension.dart';
import 'package:wedevs/Model/auth.dart';
import 'package:wedevs/Route/route.dart';
import 'package:wedevs/Theme/themes.dart';
import 'package:wedevs/URL/app_constant.dart';
import 'package:wedevs/URL/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'app_controller.dart';

class SplashController extends GetxController {
  AppController? appProvider;
  bool isAlive=true;

  Rx<AnimationController>? controller;
  Rx<Animation>? heartbeatAnimation;

  @override
  void onInit() {
    super.onInit();
    appProvider=Get.put(AppController());
    paddingTop=MediaQuery.of(Get.context!).padding.top;
    screenRatio=Get.width/AppConstant.defaultScreenSize.width;
    Dimension.scaleSize(screenRatio!,then: (){
      appProvider!.reactive();
    });
    assignData();
  }

  void makeAnimation(_state){
    controller=(AnimationController(vsync: _state, duration:const Duration(milliseconds: 1500))).obs;
    heartbeatAnimation=(Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
    parent: controller!.value, curve: Curves.easeInCirc))).obs;
    controller!.value.forward();
  }

  @override
  void onClose() {
    super.onClose();
    controller!.value.reset();
  }


  Future assignData()async{
    SharedPreferences.getInstance().then((pr) {
      prefs = pr;
      setAppData();
    });
    if (Platform.isAndroid) {
      URL.device_type = AppConstant.Android;
    } else if (Platform.isIOS) {
      URL.device_type = AppConstant.iOS;
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isAlive=false;
  }

  back() {

  }

  void navigationPage() async{
    try{
      if(prefs!.containsKey(AppConstant.Share_Auth)){
        Get.offAllNamed(HOME);
      }
      else {
        Get.offAllNamed(LOGIN);
      }
    }catch(e){
    }
  }

  void setAppData() async{
    //prefs!.remove(AppConstant.Share_Auth);
    if(prefs!.containsKey(AppConstant.Share_Auth)){
      auth=Auth.fromJson(json.decode(prefs!.getString(AppConstant.Share_Auth)!));
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Themes.Background,statusBarIconBrightness: Brightness.dark,systemNavigationBarColor: Colors.white,systemNavigationBarIconBrightness: Brightness.dark));
    Timer(const Duration(seconds: 3),(){
      navigationPage();
    });
  }

}