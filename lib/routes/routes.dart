import 'package:cana_cabana/core/bindings/add_new_card_binding.dart';
import 'package:cana_cabana/core/bindings/delivery_info_binding.dart';
import 'package:cana_cabana/core/bindings/home_wrapper_binding.dart';
import 'package:cana_cabana/core/bindings/login_binding.dart';
import 'package:cana_cabana/core/bindings/payment_method_binding.dart';
import 'package:cana_cabana/core/bindings/product_details_binding.dart';
import 'package:cana_cabana/core/bindings/receipt_binding.dart';
import 'package:cana_cabana/core/bindings/select_store_binding.dart';
import 'package:cana_cabana/core/bindings/sign_up_binding.dart';
import 'package:cana_cabana/core/bindings/splash_screen_binding.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/cart/screens/add_new_card.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/cart/screens/delivery_info.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/cart/screens/moneris_webview.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/cart/screens/payment_method.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/cart/screens/receipt.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/home/screens/product_details.dart';
import 'package:cana_cabana/core/views/home_wrapper/home_wrapper.dart';
import 'package:cana_cabana/core/views/select_store/select_store.dart';
import 'package:cana_cabana/core/views/splash/get_started.dart';
import 'package:cana_cabana/core/views/splash/location_services.dart';
import 'package:cana_cabana/core/views/splash/splash_screen.dart';
import 'package:cana_cabana/ui/login1.dart';
import 'package:cana_cabana/ui/signup4.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppRoute {
  static const String splashScreen = "/";
  static const String getStarted = "/getStarted";
  static const String locationServices = "/locationServices";
  static const String login = "/login";
  static const String signUp = "/signUp";
  static const String selectStore = "/selectStore";
  static const String homeWrapper = "/homeWrapper";
  static const String productDetails = "/productDetails";
  static const String deliveryInfo = "/deliveryInfo";
  static const String paymentMethod = "/paymentMethod";
  static const String addNewCard = "/addNewCard";
  static const String receipt = "/receipt";
  static const String searchResults = "/searchResults";
  static const String moneris = "/moneris";
  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        SplashScreenBinding(),
      ],
    ),
    GetPage(
      name: getStarted,
      page: () => GetStarted(),
      bindings: [
        SplashScreenBinding(),
      ],
    ),
    GetPage(
      name: locationServices,
      page: () => const PermissionsScreen(),
      bindings: [
        SplashScreenBinding(),
      ],
    ),
    GetPage(
      name: homeWrapper,
      page: () => HomeWrapper(),
      bindings: [
        HomeWrapperBinding(),
      ],
      // curve: Curves.easeOut,
      // transitionDuration: Duration(milliseconds: 700),
    ),
    GetPage(
      name: productDetails,
      page: () => ProductDetails(),
      bindings: [
        ProductDetailsBinding(),
      ],
    ),
    GetPage(
      name: deliveryInfo,
      page: () => const DeliveryInfo(),
      bindings: [
        DeliveryInfoBinding(),
      ],
    ),
    GetPage(
      name: paymentMethod,
      page: () => PaymentMethod(),
      bindings: [
        PaymentMethodBinding(),
      ],
    ),
    GetPage(
      name: addNewCard,
      page: () => const AddNewCard(),
      bindings: [
        AddNewCardBinding(),
      ],
    ),
    GetPage(
      name: receipt,
      page: () => const ReceiptScreen(),
      bindings: [
        ReceiptBinding(),
      ],
    ),
    GetPage(
      name: selectStore,
      page: () => SelectStore(),
      bindings: [
        SelectStoreBinding(),
      ],
      transition: Transition.cupertino,
      curve: Curves.easeOut,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: login,
      page: () => const Login1(),
      bindings: [
        LogInBinding(),
      ],
      transition: Transition.cupertino,
      curve: Curves.easeOut,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: signUp,
      page: () => const Signup4(),
      bindings: [
        SignUpBinding(),
      ],
      transition: Transition.cupertino,
      curve: Curves.easeOut,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: moneris,
      page: () => MonerisCheckoutPage(),
      transition: Transition.cupertino,
      curve: Curves.easeOut,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  ];
}
