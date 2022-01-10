import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedevs/Dimension/dimension.dart';
import 'package:wedevs/Theme/themes.dart';
import 'package:wedevs/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget EmptyView({String image='assets /no-data.svg',String? message}){
  return SizedBox(
    width: Get.width,
    height: 300,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(image,height: 200,color: Themes.Grey.withOpacity(0.5),),
        SizedBox(height: Dimension.Padding,),
        Text(message?? language.No_data_here,style: TextStyle(color: Themes.Primary2,fontSize: Dimension.Text_Size_Big,fontWeight: FontWeight.bold),),
      ],
    ),
  );
}