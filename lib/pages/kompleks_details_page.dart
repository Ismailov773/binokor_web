import 'package:binokor_web/getconrollers/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/Dom.dart';
import '../models/ImageDom.dart';
import '../models/uij.dart';

PageController _pageController = PageController(initialPage: 0, keepPage: true);
final Controller controller = Get.find();

List<String> _listUrl = [];
int page = 0;

class KompleksDetailesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _listUrl = [
      '${UiJ.url}kompleks/download/house/${controller.kompleks!.mainimagepath}',
      '${UiJ.url}kompleks/download/house/${controller.kompleks!.mainimagepathfirst}',
      '${UiJ.url}kompleks/download/house/${controller.kompleks!.mainimagepathsecond}'
    ];

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
                              fontSize: MediaQuery.of(context).size.width > UiJ.widthSize ? 30 : 15,
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
                    child: StatefulBuilder(builder: (context, setState) {
                      return PageView(
                          controller: _pageController,
                          // reverse: true,
                          allowImplicitScrolling: true,
                          onPageChanged: (index) {
                            setState(() {
                              page = index;
                            });
                          },
                          children: _listUrl.map((e) {
                            return Stack(
                              // alignment: Alignment.center,
                              fit: StackFit.expand,
                              children: [
                                Image.network(e, fit: BoxFit.fill, errorBuilder:
                                    (context, exception, stackTrace) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }),
                                Align(
                                    // padding: EdgeInsets.only(right: 20),
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                        iconSize: 180,
                                        onPressed: () {
                                          // setState((){
                                          page--;
                                          _pageController.previousPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease);

                                          // });
                                        },
                                        icon: Icon(
                                          Icons.chevron_left_sharp,
                                          color: Colors.white,
                                          size: 80,
                                        ))),
                                Align(
                                    // padding: EdgeInsets.only(right: 20),
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                        iconSize: 180,
                                        onPressed: () {
                                          // setState((){
                                          page++;
                                          _pageController.nextPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease);

                                          // });
                                        },
                                        icon: Icon(
                                          Icons.chevron_right_sharp,
                                          color: Colors.white,
                                          size: 80,
                                        ))),
                                page != 0
                                    ? Container()
                                    : Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(
                                            left: 100, right: 100, top: 30),
                                        child: Text(
                                          controller.kompleks!.description!,
                                          style: TextStyle(
                                              fontFamily: UiJ.fontbold,
                                              color: Colors.white,
                                              fontSize: 50),
                                        ),
                                      )
                              ],
                            );
                          }).toList());
                    })),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.only(left: 100),
                    alignment: Alignment.topLeft,
                    child: Text("Проекты строительство",
                        style: TextStyle(
                            fontSize: UiJ.sizeweight(context) ? 20 : 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: UiJ.fontbold))),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                controller.listImageDom.length == 0
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        padding: EdgeInsets.only(left: 100, right: 100),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: layoutPicture()),
                Divider(),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
          ],
        ))));
  }

  showDialogPicture(BuildContext context, int idx) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Проект дома'),
          content: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue.shade800)),
                  child: Image.network(
                      '${UiJ.url}imagedata/download/images/${controller.listImageDom[idx].imagepath}'))),
          actions: <Widget>[
            TextButton(
              child: Text('Закрыть'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

  Widget layoutPicture() {
    return GridView.builder(
      itemCount: controller.listImageDom.length,
      itemBuilder: (context, idx) {
        return InkWell(
            onTap: () {
              showDialogPicture(context, idx);
            },
            child: Container(
              child: Card(
                  elevation: 5,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade800)),
                      child: Image.network(
                          '${UiJ.url}imagedata/download/images/${controller.listImageDom[idx].imagepath}'))),
            ));
      },
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    );
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
