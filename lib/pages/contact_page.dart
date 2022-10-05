
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/uij.dart';
import '../widgets/googlemap.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 100, right: 100, top: 30),
        child: Container(
            child: Row(children: [
          Expanded(
              child: Column(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Адрес компании:',
                            style:
                                TextStyle(fontSize: 30, fontFamily: UiJ.fontbold)),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            WidgetSpan(child: Icon(Icons.location_on_rounded, color: Colors.blue)),
                            TextSpan(
                                text: '${UiJ.adress}',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: UiJ.font))
                          ]),
                        )
                      ])),
              SizedBox(
                height: 50,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Телефон',
                            style:
                                TextStyle(fontSize: 30, fontFamily: UiJ.fontbold)),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            WidgetSpan(child: Icon(Icons.phone, color: Colors.blue,)),
                            TextSpan(
                                text: '${UiJ.phone}',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: UiJ.font))
                          ]),
                        )
                      ])),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      UiJ.callTelegram;
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Телеграм',
                              style: TextStyle(
                                  fontSize: 30, fontFamily: UiJ.fontbold)),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.telegram,
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                  text: UiJ.telegram,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: UiJ.font))
                            ]),
                          )
                        ])),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      // UiJ.callTelegram;
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('E-mail',
                              style: TextStyle(
                                  fontSize: 30, fontFamily: UiJ.fontbold)),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.email,
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                  text: "info@dsk.uz",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: UiJ.font))
                            ]),
                          )
                        ])),
              )
            ],
          )),
          VerticalDivider(),
          Expanded(
            flex: 2,
            child: Container(
              width: 500,
                height: 800,
                padding: EdgeInsets.all(10), child: Card(child: GoogleMap())),
          )
        ])));
  }
}
