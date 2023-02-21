import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/uij.dart';

class AdressPage extends StatelessWidget {
  const AdressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Padding(
        padding: EdgeInsets.only(left: 80, right: 80, top: 20),
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Адрес компании:',
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 25 : 30,
                              fontFamily: UiJ.fontbold,
                              color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(Icons.location_on_rounded,
                                  color: Colors.blue)),
                          TextSpan(
                              text: '${UiJ.adress}',
                              style: TextStyle(
                                  fontSize: UiJ.sizeweight(context) ? 20 : 25,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: UiJ.font,
                                  color: Colors.white))
                        ]),
                      )
                    ])),
            SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.topLeft,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '${UiJ.phone}  ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: UiJ.font,
                                  color: Colors.white)),
                        ]),
                      )
                    ])),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: () {
                    UiJ.callTelegram;
                  },
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.telegram,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: UiJ.telegram,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: UiJ.font,
                                    color: Colors.white))
                          ]),
                        )
                      ])),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: () {
                    // UiJ.callTelegram;
                  },
                  child: Column(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "info@dsk.uz",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font,
                                        color: Colors.white))
                              ]),
                            ),
                          ]),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Copyright © 2020 Template by DSK BINOKOR",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )),
            )
          ],
        )));
  }
}
