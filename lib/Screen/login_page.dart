import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevs/Controller/login_controller.dart';
import 'package:wedevs/Dimension/dimension.dart';
import 'package:wedevs/Packege/Loading_Button/loading_button.dart';
import 'package:wedevs/Route/route.dart';
import 'package:wedevs/Theme/themes.dart';
import 'package:wedevs/Widgets/default_appbar.dart';
import 'package:wedevs/Widgets/default_textfield.dart';
import 'package:wedevs/main.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          body: Form(key: controller.formKey, child: mainView()),
        );
      },
    );
  }

  Widget mainView() {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: Dimension.Padding,),
          Align(
              alignment: Alignment.center,
              child: Image.asset('assets/banner.png', height: Get.height * 0.1,)
          ),
          Padding(
            padding: EdgeInsets.only(left: Dimension.Size_30, right: Dimension.Size_30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.05,),
                Text(language.Sign_In,
                  style: Get.textTheme.headline1!.copyWith(
                      fontSize: Dimension.Size_24),),
                SizedBox(height: Dimension.Size_40,),
                DefaultTextField(
                  controller: controller.username,
                  label: language.Email,
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: Dimension.Padding,),
                      SvgPicture.asset('assets/email.svg',width: Dimension.Size_24,),
                      SizedBox(width: Dimension.Padding,),
                    ],
                  )
                ),
                SizedBox(height: Dimension.Padding,),
                Obx(() {
                  return DefaultTextField(
                    controller: controller.password,
                    label: language.Password,
                    textInputType: TextInputType.visiblePassword,
                    obscureText: controller.obscureText.value,
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: Dimension.Padding,),
                          SvgPicture.asset('assets/password.svg',width: Dimension.Size_24,),
                          SizedBox(width: Dimension.Padding,),
                        ],
                      ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.obscureText(
                              !controller.obscureText.value);
                        },
                        icon: Icon(controller.obscureText.value ? Icons
                            .visibility_off_rounded : Icons
                            .visibility_rounded)
                    )
                  );
                }),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: (){},
                    child: Text(language.Forgot_Password,style: Get.textTheme.bodyText2,)
                  ),
                ),
              ],
            ),
          ),
          Obx(() =>
              LoadingButton(
                isLoading: controller.Loading.value,
                onPressed: () => controller.requestLogin(),
                buttonDecoration: ButtonDecoration.Shadow,
                backgroundColor: Themes.Primary,
                child: Container(
                    margin: EdgeInsets.only(top: Dimension.Size_10, bottom: Dimension.Size_10),
                    alignment: Alignment.center,
                    width: Get.width-Dimension.Size_60,
                    height: Dimension.Size_44,
                    child: Text(language.Login,
                      style: Get.textTheme.headline1!.copyWith(
                          color: Themes.White,fontWeight: Dimension.textMedium),
                    )
                ),
              )),
          Padding(
            padding: EdgeInsets.all(Dimension.Size_40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){},
                  child: SizedBox(
                    height: Dimension.Size_60,
                    child: SvgPicture.asset('assets/fb.svg',height: Dimension.Size_24,)
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                      )
                    )
                  ),
                ),
                SizedBox(width: Dimension.Padding,),
                ElevatedButton(
                  onPressed: (){},
                  child: SizedBox(
                      height: Dimension.Size_60,
                      child: SvgPicture.asset('assets/google.svg',height: Dimension.Size_24,)
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      )
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
                onPressed: (){},
                child: Text(language.Create_New_Account,style: Get.textTheme.bodyText1!.copyWith(fontSize: Dimension.Size_20),)
            ),
          ),
        ],
      ),
    );
  }

}
