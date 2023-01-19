import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../getconrollers/Controller.dart';
import '../models/ImageDom.dart';
import '../models/uij.dart';

final Controller controller = Get.find();
List<ImageDom> _listProject = controller.pageKomleks == 1
    ? controller.listImageDom
        .where((p0) => p0.layout == true && p0.web == true)
        .toList()
    : controller.listImageDom
        .where((p0) => p0.layout == false && p0.web == true)
        .toList();
 String path = _listProject.length == 0 ? '' : _listProject[0].imagepath!;

class KompleksForthPage extends StatelessWidget {
  const KompleksForthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
              top: 10,
              left: MediaQuery.of(context).size.width > UiJ.widthSize ? 50 : 20,
              right:
                  MediaQuery.of(context).size.width > UiJ.widthSize ? 50 : 20),
          // width: 100,
          height: 50,
          alignment: Alignment.topLeft,
          child: InkWell(
              onTap: () {
                controller.changeindextab(2);
                controller.changeindexpage(5);
              },
              child: Row(
                children: [
                  Icon(Icons.keyboard_arrow_left),
                  Text(
                      '${controller.kompleks!.title!} (${controller.titleKompleks})',
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.width > UiJ.widthSize
                                  ? 30
                                  : 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: UiJ.fontbold)),
                ],
              )),
        ),
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(
                    top: 10,
                    left: MediaQuery.of(context).size.width > UiJ.widthSize
                        ? 50
                        : 20,
                    right: MediaQuery.of(context).size.width > UiJ.widthSize
                        ? 50
                        : 20),
                child: StatefulBuilder(builder: (context, setSatet){
                  return Row(
                    children: [
                      Expanded(
                          child: ListView(
                              scrollDirection: Axis.vertical,
                              // itemExtent: 4,
                              children: _listProject.map((e) {
                                return InkWell(
                                    onTap: (){
                                      setSatet((){
                                        path = e.imagepath!;
                                      });
                                    },
                                    child:  Container(
                                        child: Card(
                                          elevation: 5,
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Image.network(
                                              '${UiJ.url}imagedata/download/images/${e.imagepath}',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )));
                              }).toList())),
                      Expanded(
                          flex: 4,
                          child: Image.network(
                              '${UiJ.url}imagedata/download/images/${path}',
                              errorBuilder: (context, exception, stackTrace) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }))
                    ],
                  );
                })))
      ],
    );
  }
}
