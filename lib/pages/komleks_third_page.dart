import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../getconrollers/Controller.dart';
import '../models/uij.dart';

final Controller controller = Get.find();

class KompleksThirdPage extends StatelessWidget {
  const KompleksThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
                  Text('${controller.kompleks!.title!} (основной)',
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
          options: CarouselOptions(
            viewportFraction: 0.8,
            aspectRatio: 16 / 9,
          ),
          items: [
            Container(
              child: Image.network(
                '${UiJ.url}kompleks/download/house/${controller.kompleks!.mainimagepath}',
                fit: BoxFit.fill,
              ),
            ),
            Container(
                child: Image.network(
              '${UiJ.url}kompleks/download/house/${controller.kompleks!.mainimagepathfirst}',
              fit: BoxFit.fill,
            )),
            Container(
                child: Image.network(
              '${UiJ.url}kompleks/download/house/${controller.kompleks!.mainimagepathsecond}',
              fit: BoxFit.fill,
            )),
          ],
        )),
      ],
    );
  }
}
