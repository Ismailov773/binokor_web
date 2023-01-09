import 'dart:io';

import 'package:binokor_web/pages/zero_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getconrollers/Controller.dart';
import 'models/uij.dart';
import 'package:url_strategy/url_strategy.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  // HttpClient client = HttpClient();
  // client.badCertificateCallback =
  //     (X509Certificate cert, String host, int port) => true;
  // HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: UiJ.companyName,
      theme: ThemeData(
        backgroundColor: Colors.black,
        bottomAppBarColor: Colors.black,
        textTheme: TextTheme(),
        fontFamily: UiJ.font,
        // textTheme: TextTheme(bodyText1: ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //primarySwatch: Colors.black87,
      ),
      initialRoute: '/',
      initialBinding: HomeBindings(),
      getPages: [
        GetPage(name: '/', page: () => ZeroPage()),
        // GetPage(name: '/kompleksdetails', page: () => KompleksDetailesPage()),
      ],
    );
  }
}
