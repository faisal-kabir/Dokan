import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wedevs/AppHelper/helper.dart';
import 'package:wedevs/Controller/home_controller.dart';
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
  HomeController homeController=Get.find();
  TextEditingController filter=TextEditingController();

  List<Product>? products;
  List<Product>? tempProducts;

  @override
  void onInit() {
    super.onInit();
    filter.addListener(filterListener);
    getAllProducts();
  }

  void filterListener() {
    try {
      List<Product> list=[];
      if(filter.text.isNotEmpty) {
        products!.forEach((element) {
          if(element.name!.toLowerCase().contains(filter.text.toLowerCase())){
            list.add(element);
          }
        });
      } else {
        list.addAll(products!);
      }
      tempProducts=list;
      update();
    } catch (e) {

    }
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
    tempProducts=[];
    jsonResult.forEach((element) {
      products!.add(Product.fromJson(element));
      tempProducts!.add(Product.fromJson(element));
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
