import 'package:binokor_web/getconrollers/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:intl/intl.dart';

import '../models/ImageDom.dart';
import '../models/uij.dart';

DateFormat formattedDate = DateFormat('dd-MM-yyyy');
List<ImageDom> _listImage = [];
final Controller controller = Get.find();

class KompleksPage extends StatelessWidget {
  KompleksPage() : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width > UiJ.widthSize ? 100 : 20,
          right: MediaQuery.of(context).size.width > UiJ.widthSize ? 100 : 20),
      child: Obx(() => main(context)),
    );
  }

  Widget main(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          alignment: Alignment.topLeft,
          child: Text("Строительство",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > UiJ.widthSize
                      ? 30
                      : 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: UiJ.fontbold)),
        ),
        Divider(),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: controller.listKompleks.length,
                itemBuilder: (context, index) {
                  return Container(

                      // padding: EdgeInsets.all(40),
                      child: Card(
                          child: InkWell(
                              onTap: () {
                                controller.changeKompleks(
                                    controller.listKompleks[index]);
                                controller.changeindexpage(5);
                              },
                              child: HoverContainer(
                                padding: EdgeInsets.all(10),
                                hoverColor: UiJ.hovercolor,
                                cursor: MouseCursor.defer,
                                height: MediaQuery.of(context).size.width <
                                        UiJ.widthSize
                                    ? MediaQuery.of(context).size.height
                                    : null,
                                child: MediaQuery.of(context).size.width >
                                        UiJ.widthSize
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          index % 2 == 0
                                              ? getCar(index)
                                              : getText(context, index),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    UiJ.widthSize
                                                ? 30
                                                : 15,
                                          ),
                                          index % 2 == 0
                                              ? getText(context, index)
                                              : getCar(index),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          index % 2 == 0
                                              ? getCar(index)
                                              : getText(context, index),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    UiJ.widthSize
                                                ? 30
                                                : 15,
                                          ),
                                          index % 2 == 0
                                              ? getText(context, index)
                                              : getCar(index),
                                        ],
                                      ),
                              ))));
                })),
      ],
    );
  }

  Widget getCar(int index) {
    return Expanded(
        child: Card(
            elevation: 5,
            child: Image.network(
              '${UiJ.url}kompleks/download/house/${controller.listKompleks[index].mainimagepath}',
              // height: 50,
              // width: 50,
              errorBuilder: (context, exception, stackTrace) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )));
  }

  Widget getText(BuildContext context, int index) {
    return Expanded(
        flex: 2,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(controller.listKompleks[index].typehouse!,
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w900,
                      fontFamily: UiJ.font)),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(controller.listKompleks[index].title!,
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width > UiJ.widthSize
                              ? 30
                              : 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: UiJ.fontbold)),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // padding: EdgeInsets.only(right: 400),
              child: Text(controller.listKompleks[index].description!,
                  style: TextStyle(fontSize: 15, fontFamily: UiJ.font),
                  textAlign: TextAlign.justify),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width > UiJ.widthSize
                        ? 400
                        : 20),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.square,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                    TextSpan(
                      style: TextStyle(
                        fontFamily: UiJ.fontbold,
                        fontSize: 20,
                      ),
                      text: "  Дата проекта:  ",
                    ),
                    TextSpan(
                        text: formattedDate.format(DateTime.parse(
                            controller.listKompleks[index].dateproject!)),
                        style: TextStyle(fontFamily: UiJ.font, fontSize: 20))
                  ]),
                )),
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width > UiJ.widthSize
                        ? 400
                        : 20),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.square,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                    TextSpan(
                      style: TextStyle(
                        fontFamily: UiJ.fontbold,
                        fontSize: 20,
                      ),
                      text: "  Заказчик:  ",
                    ),
                    TextSpan(
                        text: controller.listKompleks[index].customer!,
                        style: TextStyle(fontFamily: UiJ.font, fontSize: 20))
                  ]),
                )),
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width > UiJ.widthSize
                        ? 400
                        : 20),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.square,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                    TextSpan(
                      style: TextStyle(
                        fontFamily: UiJ.fontbold,
                        fontSize: 20,
                      ),
                      text: "  Подрядчик:  ",
                    ),
                    TextSpan(
                        text: UiJ.companyName,
                        style: TextStyle(fontFamily: UiJ.font, fontSize: 20))
                  ]),
                )),
            SizedBox(
              height: 20,
            ),
            // SizedBox(
            //     width: 300,
            //     height: 50,
            //     child: ElevatedButton(
            //         onPressed: () {
            //           for (Dom dom in controller.listKompleks[index].domSet!) {
            //             if (dom.imageDataList!.length == 0) {
            //               continue;
            //             }
            //
            //             _listImage.addAll(dom.imageDataList!);
            //           }
            //           showDialogphoto(context, controller.listKompleks[index].title!);
            //         },
            //         child: Text(
            //           "Процесс строительство",
            //           style: TextStyle(fontFamily: UiJ.font, fontSize: 20),
            //         )))
          ],
        ));
  }

  Future<void> showDialogphoto(BuildContext context, String title) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 25, fontFamily: UiJ.fontbold),
              ),
              Divider(),
            ],
          ),
          content: SizedBox(
              width: 1200,
              child: ListView.builder(
                  itemCount: _listImage.length,
                  itemBuilder: (context, idx) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Image.network(
                              '${UiJ.url}api/les/download/images/${_listImage[idx].imagepath}',
                              height: 600,
                              errorBuilder: (context, exception, stackTrace) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Text(
                                        formattedDate.format(DateTime.parse(
                                            _listImage[idx].datacreate!)),
                                        style: TextStyle(
                                            fontFamily: UiJ.fontbold,
                                            fontSize: 20))),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    child: Text(_listImage[idx].name!,
                                        style: TextStyle(
                                            fontFamily: UiJ.fontbold,
                                            fontSize: 20))),
                              ],
                            )
                          ],
                        ),
                        Divider()
                      ],
                    );
                  })),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Закрыть',
                style: TextStyle(fontSize: 20, fontFamily: UiJ.fontbold),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }
}
