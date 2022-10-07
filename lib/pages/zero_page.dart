import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

                  Text(UiJ.lozung, style: TextStyle(fontSize: 30, fontFamily: UiJ.font),)
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
    return await Future.delayed(Duration(seconds: 1), () {})
        .then((value) => Home());
  }
}
