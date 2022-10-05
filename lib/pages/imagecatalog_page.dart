import 'package:binokor_web/models/Catalog.dart';
import 'package:binokor_web/provider/simple_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/uij.dart';

class ImageCatalogPage extends StatelessWidget {
  final Catalog? catalog;

  ImageCatalogPage({Key? key, this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 100, right: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Каталоги ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                      fontFamily: UiJ.font,
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.read<SimpleProvider>().changeindexpage(1);
                    }),
              TextSpan(
                  text: " / Изделия",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      fontFamily: UiJ.font))
            ])),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Expanded(child: Container()),
          ],
        ));
  }
}
