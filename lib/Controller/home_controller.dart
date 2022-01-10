import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wedevs/Dimension/dimension.dart';
import 'package:wedevs/Theme/themes.dart';
import 'package:wedevs/URL/api_client.dart';
import 'package:wedevs/URL/url.dart';
import 'package:wedevs/Widgets/list_animation.dart';

import '../main.dart';

class HomeController extends GetxController{

  PageController pageController=PageController(initialPage: 0);
  RxInt currentIndex=0.obs;
  List<String> tabs=[
    'assets/home.svg',
    'assets/more.svg',
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
  void filterDialog() async {
    Get.generalDialog(
      barrierLabel: language.Filter,
      transitionDuration: const Duration(milliseconds: 700),
      barrierDismissible: true,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            child: FilterDialog(),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
}

class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {

  List<String> filterElements = [
    'Newest',
    'Oldest',
    'Price Low > High',
    'Price High > Low',
    'Best Selling'
  ];
  RxInt selectedFilter = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimension.Size_5)
      ),
      color: Themes.Background,
      child: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                height: 3,
                width: Get.width * 0.2,
                margin: EdgeInsets.only(
                    top: Dimension.Size_26, bottom: Dimension.Size_20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.Size_2),
                    color: Themes.Primary.withOpacity(0.3)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimension.Padding, bottom: Dimension.Size_4),
              child: Text(language.Filter, style: Get.textTheme.headline1,),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  left: Dimension.Padding, right: Dimension.Padding),
              physics: NeverScrollableScrollPhysics(),
              itemCount: filterElements.length,
              itemBuilder: (context, index) {
                return ListAnimation(
                    index: index,
                    child: Obx(() {
                      return Container(
                        margin: EdgeInsets.only(top: Dimension.Size_12),
                        child: InkWell(
                          onTap: () {
                            selectedFilter(index);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(selectedFilter.value == index
                                  ? 'assets/checked.svg'
                                  : 'assets/unchecked.svg',
                                height: Dimension.Size_24,),
                              SizedBox(width: Dimension.Size_12,),
                              Text(filterElements[index],
                                style: Get.textTheme.bodyText1,)
                            ],
                          ),
                        ),
                      );
                    })
                );
              },
            ),
            Container(
              margin: EdgeInsets.all(Dimension.Padding).copyWith(
                  top: Dimension.Size_40),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Container(
                          height: Dimension.Size_60,
                          alignment: Alignment.center,
                          child: Text(language.Cancel,
                              style: Get.textTheme.headline1!.copyWith(
                                  fontWeight: Dimension.textNormal,
                                  color: Themes.Grey))
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white),
                          elevation: MaterialStateProperty.all<double>(0),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Color(0xFFD2DBE0))
                              )
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: Dimension.Padding,),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Container(
                          height: Dimension.Size_60,
                          alignment: Alignment.center,
                          child: Text(language.Apply,
                              style: Get.textTheme.headline1!.copyWith(
                                  fontWeight: Dimension.textNormal,
                                  color: Themes.White))
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Themes.Primary2),
                          elevation: MaterialStateProperty.all<double>(0),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          )
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
