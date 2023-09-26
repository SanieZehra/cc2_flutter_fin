import 'package:cc2_flutter_fin/views/cart_view.dart';
import 'package:cc2_flutter_fin/views/dashboard_view.dart';
import 'package:cc2_flutter_fin/views/homepage_view.dart';
import 'package:cc2_flutter_fin/views/login_view.dart';
import 'package:cc2_flutter_fin/views/order_history.dart';
import 'package:cc2_flutter_fin/views/privacy_policy.dart';
import 'package:cc2_flutter_fin/views/success_view.dart';
import 'package:cc2_flutter_fin/views/terms_and_conditions_view.dart';
import 'package:get/get.dart';

import '../views/checkout_view.dart';
import '../views/forgot_password_view.dart';
import '../views/review_view.dart';
import '../views/signup_view.dart';
import '../views/splash_view.dart';


class ApplicationRoutes extends GetxController{

  static List<GetPage<dynamic>> routes=[
    GetPage(name: "/splash", page: ()=>SplashView()),
    GetPage(name: '/login', page:()=> LoginView(), transition:Transition.fade),
    GetPage(name: '/signup', page:()=> SignUpView(), transition:Transition.fade),
    GetPage(name: "/dashboard", page: ()=>MainDashboard()),
    GetPage(name: "/cart", page: ()=>CartView()),
    GetPage(name: "/success", page: ()=>SuccessView()),
    GetPage(name: "/checkoutDetails", page: ()=>CheckoutView()),
    GetPage(name: "/ReviewDetails", page: ()=>ReviewView()),
    GetPage(name: "/terms", page: ()=>TermsAndCondition()),
    GetPage(name: "/history", page: ()=>OrderHistory()),
    GetPage(name: "/privacy", page: ()=>PrivacyPolicy()),
    GetPage(name: "/forgotPassword", page: ()=>ForgotPassword()),
    GetPage(name: "/homepage", page: ()=>HomepageView())
  ];

}