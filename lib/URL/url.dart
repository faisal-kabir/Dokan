import 'package:flutter/foundation.dart';
import 'package:wedevs/URL/app_constant.dart';

import '../main.dart';

class URL {
  static String Main_Url = 'https://apptest.dokandemo.com/';
  static String device_type='android';

  static String Login=Main_Url + 'wp-json/jwt-auth/v1/token';
  static String Register=Main_Url + 'wp-json/wp/v2/users/register';
}
