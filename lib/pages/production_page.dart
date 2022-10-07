import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/uij.dart';

class ProductionPage extends StatelessWidget {
  const ProductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 100, right: 100),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("Производство",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: UiJ.fontbold)),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                UiJ.prod_description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 25, fontFamily: UiJ.font),
              ),
            )
          ],
        ));
  }
}
