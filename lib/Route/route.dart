import 'package:get/get.dart';
import 'package:wedevs/Screen/home_page.dart';
import 'package:wedevs/Screen/product_page.dart';
import 'package:wedevs/Screen/login_page.dart';
import 'package:wedevs/Screen/signup_page.dart';
import 'package:wedevs/Screen/splash.dart';


const String HOME = "/home";
const String DEMO = "/demo";
const String SPLASH_SCREEN = "/";
const String LOGIN = "/login";
const String SIGNUP = "/signup";
const String REGISTRATION = "/registration";


List<GetPage> appRoutes()=>[
  GetPage(name: SPLASH_SCREEN, page: () => Splash()),
  GetPage(name: HOME, page: () => HomePage()),
  GetPage(name: LOGIN, page: () => LoginPage()),
  GetPage(name: SIGNUP, page: () => SignUpPage()),
];
