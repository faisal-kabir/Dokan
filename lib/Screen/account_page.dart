import 'dart:async';
import 'dart:ui';


import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevs/Controller/account_controller.dart';
import 'package:wedevs/Controller/demo_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedevs/Dimension/dimension.dart';
import 'package:wedevs/Language/app_localizations.dart';
import 'package:wedevs/Packege/Loading_Button/loading_button.dart';
import 'package:wedevs/Route/route.dart';
import 'package:wedevs/Theme/themes.dart';
import 'package:wedevs/URL/app_constant.dart';
import 'package:wedevs/Widgets/default_appbar.dart';
import 'package:wedevs/Widgets/default_dialog.dart';
import 'package:wedevs/Widgets/default_textfield.dart';
import 'package:wedevs/main.dart';



class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> with TickerProviderStateMixin {
  AccountController controller= Get.put(AccountController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(language.My_Account,
              style: TextStyle(color: Themes.Text_Color),),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Themes.Background,
          ),
          body: Form(key:controller.formKey,child: mainView()),
        );
      },
    );
  }

  Widget mainView() {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: Dimension.Padding,right: Dimension.Padding),
      children: [
        SizedBox(height: Dimension.Size_32,),
        Column(
          children: [
            Container(
              height: Get.width*0.4,
              width: Get.width*0.4,
              alignment: Alignment.center,
              padding: EdgeInsets.all(Dimension.Size_8),
              decoration: DottedDecoration(shape: Shape.circle, dash: <int>[3, 4],color: Themes.Primary),
              child: ClipOval(child: Image.asset('assets/demo_user.png',fit: BoxFit.cover,height: Get.width*0.4,))
            ),
            SizedBox(height: Dimension.Size_32,),
            Text(auth!.userDisplayName!,style: Get.textTheme.headline1!.copyWith(fontSize: Dimension.Size_24),),
            SizedBox(height: Dimension.Size_6,),
            Text(auth!.userEmail!,style: Get.textTheme.bodyText1,),
          ],
        ),
        SizedBox(height: Dimension.Size_32,),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(Dimension.Size_10),
            child: Column(
              children: [
                ExpansionTile(
                  title: Text(language.Account,style: Get.textTheme.bodyText1!.copyWith(fontSize: Dimension.Size_18),),
                  leading: SvgPicture.asset('assets/account.svg',height: Dimension.Size_24,),
                  backgroundColor: Themes.White,
                  children: accountView(),
                ),
                Divider(color: Themes.Grey.withOpacity(0.5),),
                ExpansionTile(
                  title: Text(language.Password,style: Get.textTheme.bodyText1!.copyWith(fontSize: Dimension.Size_18),),
                  leading: SvgPicture.asset('assets/password.svg',height: Dimension.Size_24,),
                  backgroundColor: Themes.White,
                  children: <Widget>[
                  ],
                ),
                Divider(color: Themes.Grey.withOpacity(0.5),),
                ExpansionTile(
                  title: Text(language.Notification,style: Get.textTheme.bodyText1!.copyWith(fontSize: Dimension.Size_18),),
                  leading: SvgPicture.asset('assets/notification.svg',height: Dimension.Size_24,),
                  backgroundColor: Themes.White,
                  children: <Widget>[
                  ],
                ),
                Divider(color: Themes.Grey.withOpacity(0.5),),
                ExpansionTile(
                  title: Text(language.Wishlist,style: Get.textTheme.bodyText1!.copyWith(fontSize: Dimension.Size_18),),
                  leading: SvgPicture.asset('assets/wishlist.svg',height: Dimension.Size_24,),
                  backgroundColor: Themes.White,
                  children: <Widget>[
                  ],
                ),
                Divider(color: Themes.Grey.withOpacity(0.5),),
                ListTile(
                  onTap: () => logOut(),
                  title: Text(language.LogOut,style: Get.textTheme.bodyText1!.copyWith(fontSize: Dimension.Size_18),),
                  leading: SvgPicture.asset('assets/logout.svg',height: Dimension.Size_24,),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: Get.height*0.3,)
      ],
    );
  }

  List<Widget> accountView() {
    return <Widget>[
      Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(Dimension.Size_10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: Dimension.Size_10),
              child: Text(language.Email,style: Get.textTheme.bodyText1!.copyWith(color: Themes.Grey.withOpacity(0.5),fontSize: Dimension.Text_Size_Big),),
            ),
            DefaultTextField(
              controller: controller.email,
              borderEnable: true,
              borderColor: Themes.Grey.withOpacity(0.5),
              textInputType: TextInputType.emailAddress
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimension.Size_10,top: Dimension.Padding),
              child: Text(language.Full_Name,style: Get.textTheme.bodyText1!.copyWith(color: Themes.Grey.withOpacity(0.5),fontSize: Dimension.Text_Size_Big),),
            ),
            DefaultTextField(
              controller: controller.fullName,
              borderEnable: true,
              borderColor: Themes.Grey.withOpacity(0.5),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimension.Size_10,top: Dimension.Padding),
              child: Text(language.Street_Address,style: Get.textTheme.bodyText1!.copyWith(color: Themes.Grey.withOpacity(0.5),fontSize: Dimension.Text_Size_Big),),
            ),
            DefaultTextField(
              controller: controller.address,
              borderEnable: true,
              borderColor: Themes.Grey.withOpacity(0.5),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimension.Size_10,top: Dimension.Padding),
              child: Text(language.Apt_Suite_Bldg,style: Get.textTheme.bodyText1!.copyWith(color: Themes.Grey.withOpacity(0.5),fontSize: Dimension.Text_Size_Big),),
            ),
            DefaultTextField(
              controller: controller.apartment,
              borderEnable: true,
              borderColor: Themes.Grey.withOpacity(0.5),
              enableValidation: false
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimension.Size_10,top: Dimension.Padding),
              child: Text(language.Zip_Code,style: Get.textTheme.bodyText1!.copyWith(color: Themes.Grey.withOpacity(0.5),fontSize: Dimension.Text_Size_Big),),
            ),
            SizedBox(
              width: Get.width*0.3,
              child: DefaultTextField(
                controller: controller.zipCode,
                borderEnable: true,
                borderColor: Themes.Grey.withOpacity(0.5),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Dimension.Size_20,bottom: Dimension.Size_20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: Container(
                          height: Dimension.Size_50,
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
                      onPressed: () => controller.updateProfile(),
                      child: Container(
                          height: Dimension.Size_50,
                          alignment: Alignment.center,
                          child: Text(language.Save,
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
      )
    ];
  }


  void logOut() {
    Get.dialog(
        DefaultDialog(
          title: language.LogOut,
          enableCloseButton: true,
          child: Text(language.Are_you_sure_you_want_to_logout, style: Theme
              .of(context)
              .textTheme
              .bodyText1,),
          onButtonClick: (state) {
            if (!state) {
              Get.back();
            } else {
              prefs!.clear();
              Get.offAllNamed(LOGIN);
            }
          },
        )
    );
  }
}
