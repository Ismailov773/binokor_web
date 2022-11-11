import 'package:binokor_web/getconrollers/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/uij.dart';

PageController _pageController = PageController();

class KompleksDetailesPage extends StatelessWidget {
  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: SafeArea(
            child: Container(
                // padding: EdgeInsets.only(left: 100, right: 100),
                child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 100, right: 100),
              // width: 100,
              height: 50,
              alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: () {
                    controller.changeindextab(3);
                    controller.changeindexpage(1);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.keyboard_arrow_left),
                      Text(controller.kompleks!.title!,
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 20 : 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: UiJ.fontbold)),
                    ],
                  )),
            ),
            Expanded(
                child: ListView(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: PageView(
                      controller: _pageController,
                      children: [
                        Container(
                          child: Image.network(
                              '${UiJ.url}kompleks/download/house/${controller.kompleks!.mainimagepath}',
                              fit: BoxFit.fill,
                              errorBuilder: (context, exception, stackTrace) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                        ),
                        Container(
                          child: Image.network(
                              '${UiJ.url}kompleks/download/house/${controller.kompleks!.mainimagepath}',
                              fit: BoxFit.fill,
                              errorBuilder: (context, exception, stackTrace) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                        ),
                        Container(
                          child: Image.network(
                              '${UiJ.url}kompleks/download/house/${controller.kompleks!.mainimagepath}',
                              fit: BoxFit.fill,
                              errorBuilder: (context, exception, stackTrace) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                        ),
                      ],
                    )),
                Divider(),
                Container(
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.only(left: 100),
                    alignment: Alignment.topLeft,
                    child: Text("Проекты строительство",
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 20 : 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: UiJ.fontbold))),
                    ],)),
                Container(
                    child: Image.network(
                        '${UiJ.url}kompleks/download/house/${controller.kompleks!.mainimagepath}',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        errorBuilder: (context, exception, stackTrace) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })),
              ],
            )),
          ],
        ))));
  }

  Widget description() {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Image.network(
              '${UiJ.url}kompleks/download/house/${controller.kompleks!.mainimagepath}',
              errorBuilder: (context, exception, stackTrace) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Text(
                controller.kompleks!.description!,
                style: TextStyle(fontSize: 20, fontFamily: UiJ.fontbold),
              ),
            )
          ],
        ));
  }
}
