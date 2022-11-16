import 'dart:io';

import 'package:binokor_web/pages/zero_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'api/repository.dart';
import 'getconrollers/Controller.dart';
import 'models/uij.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  // HttpClient client = HttpClient();
  // client.badCertificateCallback =
  //     (X509Certificate cert, String host, int port) => true;
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => Repository(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: UiJ.companyName,
          theme: ThemeData(
            backgroundColor: Colors.black, bottomAppBarColor: Colors.black,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            //primarySwatch: Colors.black87,
          ),
          initialRoute: '/',
          initialBinding: HomeBindings(),
          getPages: [
            GetPage(name: '/', page: () => ZeroPage()),
            // GetPage(name: '/kompleksdetails', page: () => KompleksDetailesPage()),
          ],
        ));
  }
}
