import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wedevs/URL/api_client.dart';
import 'package:wedevs/URL/url.dart';

class HomeController extends GetxController{

  PageController pageController=PageController(initialPage: 0);
  RxInt currentIndex=0.obs;
  List<String> tabs=[
    'assets/home.svg',
    'assets/more.svg',
    '',
    'assets/cart.svg',
    'assets/account.svg',
  ];

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentIndex(pageController.page!.toInt());
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changePage(int index){
    pageController.animateToPage(index, duration: Duration(milliseconds: 30), curve: Curves.easeInOut);
    currentIndex(index);
  }
}
