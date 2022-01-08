import 'dart:async';
import 'dart:ui';


import 'package:get/get.dart';
import 'package:wedevs/Controller/demo_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedevs/Dimension/dimension.dart';
import 'package:wedevs/Language/app_localizations.dart';
import 'package:wedevs/Packege/Loading_Button/loading_button.dart';
import 'package:wedevs/Theme/themes.dart';
import 'package:wedevs/URL/app_constant.dart';
import 'package:wedevs/Widgets/default_appbar.dart';
import 'package:wedevs/main.dart';



class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> with TickerProviderStateMixin {
  DemoController controller= Get.put(DemoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: DefaultAppbar(title: 'Demo',),
          body: mainView(),
        );
      },
    );
  }

  Widget mainView() {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: Dimension.Padding,right: Dimension.Padding),
      children: [

      ],
    );
  }

}
