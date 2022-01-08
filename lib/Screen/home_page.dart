import 'dart:async';
import 'dart:ui';


import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevs/Controller/demo_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedevs/Controller/home_controller.dart';
import 'package:wedevs/Dimension/dimension.dart';
import 'package:wedevs/Language/app_localizations.dart';
import 'package:wedevs/Packege/Loading_Button/loading_button.dart';
import 'package:wedevs/Screen/product_page.dart';
import 'package:wedevs/Theme/themes.dart';
import 'package:wedevs/URL/app_constant.dart';
import 'package:wedevs/Widgets/default_appbar.dart';
import 'package:wedevs/main.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          body: SafeArea(child: mainView()),
          bottomNavigationBar: bottomNavigationBar(),
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerDocked,
          floatingActionButton: Container(
            padding: EdgeInsets.all(Dimension.Padding),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 10),
                  blurRadius: 6,
                ),
              ],
              gradient: LinearGradient(
                  colors: [Color(0xFFFF679B), Color(0xFFFF7B51)]),
            ),
            child: Icon(Icons.search, color: Themes.White,),
          ),
        );
      },
    );
  }

  Widget mainView() {
    return PageView(
      controller: controller.pageController,
      children: [
        ProductPage(),
        Container(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }

  bottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(15),
        topLeft: Radius.circular(15),
      ),
      child: BottomAppBar(
        child: Container(
          margin: EdgeInsets.all(Dimension.Padding).copyWith(left: Dimension.Size_30,right: Dimension.Size_30),
          height: Dimension.Size_30,
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: controller.tabs.asMap().map((index, e) =>
                  MapEntry(
                      index,
                      e.isNotEmpty ? GestureDetector(
                          onTap: () => controller.changePage(index),
                          child: SvgPicture.asset(e, height: Dimension.Size_24,
                            width: Dimension.Size_24,
                            color: controller.currentIndex.value == index
                                ? Themes.Primary
                                : Color(0xFF6E7FAA),)
                      ) : Container()
                  )).values.toList(),
            );
          }),
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        elevation: 10,
      ),
    );
  }

}
