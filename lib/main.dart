import 'dart:io';

import 'package:binokor_web/bloc/make_bloc.dart';
import 'package:binokor_web/pages/home.dart';
import 'package:binokor_web/provider/simple_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'api/repository.dart';
import 'bloc/catalog_bloc.dart';
import 'bloc/dsk_event.dart';
import 'bloc/house_bloc.dart';
import 'bloc/meneger_bloc.dart';
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

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SimpleProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => Repository(),
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      MakeBloc(repository: context.read<Repository>())
                        ..add(DskLoadEvent())),
              BlocProvider(
                  create: (context) =>
                      CatalogBloc(repository: context.read<Repository>())),
              BlocProvider(
                  create: (context) =>
                      MenegerBloc(repository: context.read<Repository>())
                        ..add(DskLoadEvent())),
              BlocProvider(
                  create: (context) =>
                      HouseBloc(repository: context.read<Repository>())
                        ..add(DskLoadEvent()))
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: UiJ.companyName,
              theme: ThemeData(
                backgroundColor: Colors.black, bottomAppBarColor: Colors.black,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                //primarySwatch: Colors.black87,
              ),
              // home: Home(),
              initialRoute: '/',
              routes: {
                // '/': (context) => LoginPage(),
                '/': (context) => Home(),
                // '/catalogimage': (context) => ImageCatalogPage(catalog: null,),
              },
            )));
  }
}
