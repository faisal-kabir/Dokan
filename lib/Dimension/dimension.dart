import 'package:flutter/material.dart';
import 'package:wedevs/main.dart';

class Dimension{
  static bool isScaled =false;
  static double Padding =16.0;
  static double Text_Size_Big =16.0;
  static double Size_2 =2.0;
  static double Size_3 =3.0;
  static double Size_4 =4.0;
  static double Size_5 =5.0;
  static double Size_6 =6.0;
  static double Size_8 =8.0;
  static double Size_9=9.0;
  static double Size_10 =10.0;
  static double Size_12 =12.0;
  static double Size_14 =14.0;
  static double Size_16 =16.0;
  static double Size_18 =18.0;
  static double Size_20 =20.0;
  static double Size_22 =22.0;
  static double Size_24 =24.0;
  static double Size_26 =26.0;
  static double Size_28 =28.0;
  static double Size_30 =30.0;
  static double Size_32 =32.0;
  static double Size_34 =34.0;
  static double Size_36 =36.0;
  static double Size_38 =38.0;
  static double Size_40 =40.0;
  static double Size_42 =42.0;
  static double Size_44 =44.0;
  static double Size_46 =46.0;
  static double Size_48 =48.0;
  static double Size_50 =50.0;
  static double Size_52 =52.0;
  static double Size_54 =54.0;
  static double Size_56 =56.0;
  static double Size_58 =58.0;
  static double Size_60 =60.0;
  static double Text_Size =14.0;
  static double Text_Size_Small =12.0;
  static double Text_Size_Small_Extra =10.0;
  static double card_elevation =Dimension.Size_2;
  static double curve_height =100;

  static int Alpha =150;
  static FontWeight textMedium=FontWeight.w600;
  static FontWeight textBold=FontWeight.w800;
  static FontWeight textNormal=FontWeight.normal;

  static double Size_100=100.0;
  static double Size_150=150.0;
  static double Size_62=62.0;
  static double Size_64=64.0;
  static double Size_66=66.0;
  static double Size_68=68.0;
  static double Size_70=70.0;
  static double Size_72=72.0;

  static void scaleSize(double scale,{Function? then}){
    if(!isScaled) {
      isScaled = true;
      Padding *= scale;
      Text_Size_Big *= scale;
      Size_2 *= scale;
      Size_3 *= scale;
      Size_4 *= scale;
      Size_5 *= scale;
      Size_6 *= scale;
      Size_8 *= scale;
      Size_9 *= scale;
      Size_10 *= scale;
      Size_12 *= scale;
      Size_14 *= scale;
      Size_16 *= scale;
      Size_18 *= scale;
      Size_20 *= scale;
      Size_22 *= scale;
      Size_24 *= scale;
      Size_26 *= scale;
      Size_28 *= scale;
      Size_30 *= scale;
      Size_32 *= scale;
      Size_34 *= scale;
      Size_36 *= scale;
      Size_38 *= scale;
      Size_40 *= scale;
      Size_42 *= scale;
      Size_44 *= scale;
      Size_46 *= scale;
      Size_48 *= scale;
      Size_50 *= scale;
      Size_52 *= scale;
      Size_54 *= scale;
      Size_56 *= scale;
      Size_58 *= scale;
      Size_60 *= scale;
      Text_Size *= scale;
      Text_Size_Small *= scale;
      Text_Size_Small_Extra *= scale;
      card_elevation *= scale;
      curve_height *= scale;

      Size_100 *= scale;
      Size_150 *= scale;
      Size_62 *= scale;
      Size_64 *= scale;
      Size_66 *= scale;
      Size_68 *= scale;
      Size_70 *= scale;
      Size_72 *= scale;
      if (then != null) {
        then();
      }
    }
  }

}