import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wedevs/Theme/themes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Widget SwipeRefresh({required RefreshController controller,required VoidCallback onRefresh,required List<Widget> children}){
  return SmartRefresher(
    child:ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: children,
    ),
    onRefresh: onRefresh,
    //header: AppConstant.swipeIndicator,
    header: Platform.isIOS
        ? ClassicHeader()
        : MaterialClassicHeader(),
    enablePullDown: true,
    enablePullUp: false,
    controller: controller,
  );
}
