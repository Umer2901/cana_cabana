import 'dart:developer';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/models/carousel_images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart' as handler;

class SplashScreenController extends GetxController {
  CarouselController carouselController = CarouselController();
  List<CarouselImage> carouselImages = [
    CarouselImage(image: AppImages.getStarted1, isLocal: true),
    CarouselImage(image: AppImages.getStarted2, isLocal: true),
  ];
  final pageController = PageController(
    initialPage: 0,
  );

  Future<bool> requestTrackingInformation() async {
    TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;
    //  _authStatus = '$status';
    // If the system can show an authorization request dialog
    if (status == TrackingStatus.notDetermined) {
      // Show a custom explainer dialog before the system dialog
      // await showCustomTrackingDialog(context);
      // Wait for dialog popping animation
      // await Future.delayed(const Duration(milliseconds: 200));
      // Request system's tracking authorization dialog
      status = await AppTrackingTransparency.requestTrackingAuthorization();
      // setState(() => _authStatus = '$status');
    }

    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    log("UUID: $uuid");
    return status == TrackingStatus.authorized;
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> initializeNotifications() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<bool> requestNotificationPermission() async {
    try {
      var settings = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.getNotificationAppLaunchDetails();

      if (settings?.didNotificationLaunchApp ?? false) {
        // App launched by tapping on a notification
        log('App launched by tapping on a notification');
      } else {
        // App launched normally
        log('App launched normally');
      }

      // Request notification permissions on iOS
      var permissionGiven = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);

      // On Android, permissions are granted at app installation time.
      // On iOS, check the result of the requestPermissions function.
      if (permissionGiven == null) {
        return false;
      }
      return permissionGiven;
    } catch (e) {
      log('Error requesting notification permission: $e');
      return false;
    }
  }

  Future<bool> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return true;
  }

  @override
  void onInit() async {
    await initializeNotifications();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
