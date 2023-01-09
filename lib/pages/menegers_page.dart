import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../getconrollers/Controller.dart';
import '../models/Meneger.dart';
import '../models/uij.dart';
import '../widgets/getDrawer.dart';

List<Meneger> _list = [];

class MenegersPage extends StatelessWidget {
  const MenegersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.find();
    return Obx(() {
      _list = controller.listMeneger;
      return main(context);
    });
  }

  Widget main(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width > UiJ.widthSize
                    ? 100
                    : 20,
                right: MediaQuery.of(context).size.width > UiJ.widthSize
                    ? 100
                    : 20),
            child: Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.topLeft,
              child: Text(
                "Руководство:",
                style: TextStyle(
                    fontFamily: UiJ.fontbold,
                    fontSize: MediaQuery.of(context).size.width > UiJ.widthSize
                        ? 30
                        : 15,
                    fontWeight: FontWeight.bold),
              ),
            )),
        Divider(),
        SizedBox(
          height: 50,
        ),
        MediaQuery.of(context).size.width > UiJ.widthSize
            ? listweb()
            : listphone(),
      ],
    );
  }

  Widget listweb() {
    return Expanded(
        child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                      child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: Container(
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(15)),
                              child: Card(
                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.circular(15)),
                                  elevation: 5,
                                  child: Container(

                                      // padding: EdgeInsets.all(20),
                                      // decoration: BoxDecoration(
                                      //     borderRadius:
                                      //         BorderRadius.circular(15)),
                                      child: Image.network(
                                          '${UiJ.url}meneger/download/meneger/${controller.listMeneger[index].imagepath}',
                                          // headers: UiJ.header_azur_image,
                                          width: 300,
                                          height: 300, errorBuilder:
                                              (context, exception, stackTrace) {
                                    return Icon(
                                      Icons.people_alt,
                                      size: 300,
                                    );
                                  }))))),
                      SizedBox(
                        width: 150,
                      ),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                            Container(
                                child: Text(
                              _list[index].name!,
                              style: TextStyle(
                                  fontFamily: UiJ.fontbold,
                                  fontSize: UiJ.sizeweight(context) ? 25 : 30),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "должность:  ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: UiJ.font)),
                                TextSpan(
                                    text: _list[index].post,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font))
                              ]),
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
                                    text: "E-mail: ",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font,
                                        height: 2)),
                                TextSpan(
                                    text: "info@dsk.uz",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font))
                              ]),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.phone,
                                  color: Colors.blue,
                                )),
                                TextSpan(
                                    text: 'телефон: ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font,
                                        height: 2)),
                                TextSpan(
                                    text: '${UiJ.phone}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font,
                                        height: 2))
                              ]),
                            ),
                            // Spacer(),
                          ])),
                    ],
                  )),
                  Divider()
                ],
              );
            }));
  }

  Widget listphone() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: Column(
                    children: [
                      Container(
                          child: Card(
                              elevation: 5,
                              child: Container(
                                  child: Image.network(
                                      '${UiJ.url}meneger/download/meneger/${controller.listMeneger[index].imagepath}',
                                      // headers: UiJ.header_azur_image,
                                      width: 300,
                                      height: 300, errorBuilder:
                                          (context, exception, stackTrace) {
                                return Icon(
                                  Icons.people_alt,
                                  size: 300,
                                );
                              })))),
                      // SizedBox(
                      //   width: 150,
                      // ),
                      Container(
                          child: Text(
                        _list[index].name!,
                        style: TextStyle(
                            fontFamily: UiJ.fontbold,
                            fontSize: UiJ.sizeweight(context) ? 25 : 30),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "должность:  ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: UiJ.font)),
                          TextSpan(
                              text: _list[index].post,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: UiJ.font))
                        ]),
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
                              text: "E-mail: ",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: UiJ.font,
                                  height: 2)),
                          TextSpan(
                              text: "info@dsk.uz",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: UiJ.font))
                        ]),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(
                            Icons.phone,
                            color: Colors.blue,
                          )),
                          TextSpan(
                              text: 'телефон: ',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: UiJ.font,
                                  height: 2)),
                          TextSpan(
                              text: '${UiJ.phone}',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: UiJ.font,
                                  height: 2))
                        ]),
                      ),
                      // Spacer(),

                      Divider()
                    ],
                  ));
                })));
  }
}
