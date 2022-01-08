import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wedevs/AppHelper/helper.dart';
import 'package:wedevs/Model/products.dart';
import 'package:wedevs/Route/route.dart';
import 'package:wedevs/URL/api_client.dart';
import 'package:wedevs/URL/url.dart';
import 'package:wedevs/Widgets/show_message.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../main.dart';

class ProductController extends GetxController{
  RxBool Loading=false.obs;
  Api_Client api_client=Api_Client();
  RefreshController refreshController=RefreshController();

  List<Product>? products;

  @override
  void onInit() {
    super.onInit();
    getAllProducts();
  }

  @override
  void onClose() {
    super.onClose();
    api_client.close();
  }



  Future getAllProducts() async {
    Loading.value=true;
    update();
    String data = await rootBundle.loadString('assets/json/products.json');
    List jsonResult = json.decode(data) as List;
    products=[];
    jsonResult.forEach((element) {
      products!.add(Product.fromJson(element));
    });
    refreshController.refreshCompleted();
    Loading.value=false;
    update();
  }

  void onRefresh() {
    products=null;
    Loading.value=true;
    update();
    getAllProducts();
  }
}
