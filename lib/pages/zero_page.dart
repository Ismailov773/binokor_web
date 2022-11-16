import 'package:binokor_web/getconrollers/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../getconrollers/initservices.dart';
import '../models/uij.dart';
import 'home.dart';

double opacityLevel = 1.0;

class ZeroPage extends StatefulWidget {
  const ZeroPage({Key? key}) : super(key: key);

  @override
  State<ZeroPage> createState() => _ZeroPageState();
}

class _ZeroPageState extends State<ZeroPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getHomePage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data as Widget;
          } else {
            return Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo1.png',
                        width: 400,
                        height: 400,
                      ),
                      Text(
                        UiJ.lozung,
                        style: TextStyle(
                            fontSize: UiJ.sizeweight(context) ? 20 : 30,
                            fontFamily: UiJ.font),
                      )
                    ],
                  ),
                ));
          }
        });
  }

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
    });
  }

  Future<Widget> getHomePage() async {
    _changeOpacity();

    await initServices();

    return await Future.delayed(Duration(seconds: 2), () {})
        .then((value) => Home());
  }
}
