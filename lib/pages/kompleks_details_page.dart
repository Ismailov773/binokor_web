import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../getconrollers/Controller.dart';
import '../models/ImageDom.dart';
import '../models/uij.dart';

final Controller controller = Get.find();
List<ImageDom> _listProject = controller.listImageDom
    .where((p0) => p0.layout == true && p0.web == true)
    .toList();
List<ImageDom> _listHistory = controller.listImageDom
    .where((p0) => p0.layout == false && p0.web == true)
    .toList();
Map<String, String> _listCard = {
  'Основной':
      '${UiJ.url}kompleks/download/house/${controller.kompleks!.mainimagepath}',
  'Проекты': (_listProject.length > 0
      ? '${UiJ.url}imagedata/download/images/${_listProject[0].imagepath}'
      : ''),
  'Процесс сторительство': (_listHistory.length > 0
      ? '${UiJ.url}imagedata/download/images/${_listHistory[0].imagepath}'
      : '')
};

CarouselController carouselController = CarouselController();
int _current = 0;

class KompleksDetailesPage extends StatelessWidget {
  const KompleksDetailesPage({Key? key}) : super(key: key);

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
                controller.changeindexpage(1);
              },
              child: Row(
                children: [
                  Icon(Icons.keyboard_arrow_left),
                  Text(controller.kompleks!.title!,
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
            child: CarouselSlider(
                items: _listCard.entries.map((e) {
                  return InkWell(
                      onTap: () {
                        if (e.key == 'Основной') {
                          controller.changePageKompleks(1);
                          controller.changeindextab(2);
                          controller.changeindexpage(8);
                        } else if (e.key == 'Проекты') {
                          controller.changetitleKompleks('Проекты');
                          controller.changePageKompleks(1);
                          controller.changeindextab(2);
                          controller.changeindexpage(9);
                        } else if (e.key == 'Процесс сторительство') {
                          controller
                              .changetitleKompleks('Процесс сторительство');
                          controller.changePageKompleks(2);
                          controller.changeindextab(2);
                          controller.changeindexpage(9);
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                              child: Text(e.key,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width >
                                                  UiJ.widthSize
                                              ? 30
                                              : 15,
                                      fontFamily: UiJ.fontbold))),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: Image.network(e.value,
                                  errorBuilder:
                                      (context, exception, stackTrace) => Icon(
                                            Icons.business,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                8,
                                            color: Colors.blue,
                                          )))
                        ],
                      ));
                }).toList(),
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height /
                        (UiJ.sizeweight(context) ? 1.4 : 1.3),
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.3,
                    initialPage: _current,
                    enableInfiniteScroll: true,
                    autoPlay: false,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (int? value, page) {
// setState(() {
                      _current = value!;

// print("${_current}");
                    }))),
      ],
    );
  }
}

//
// },
