import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getconrollers/Controller.dart';
import '../models/uij.dart';

int _current = 0;
CarouselController carouselController = CarouselController();
final Controller controller = Get.find();

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.listKompleks.length == 0
        ? Container(
            padding: EdgeInsets.all(200),
            child: Card(
                elevation: 5,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "В связи с неполадками на сервере, сайт DSK.UZ временно приостоновлено!",
                    style: TextStyle(
                        fontFamily: UiJ.font,
                        fontSize:
                            MediaQuery.of(context).size.width > UiJ.widthSize
                                ? 20
                                : 15),
                  ),
                )),
          )
        : StatefulBuilder(builder: (context, setState) {
            return ListView(
              children: [
                Center(
                    child: CarouselSlider(
                        items: controller.listKompleks.map((e) {
                          return Builder(builder: (BuildContext context) {
                            return InkWell(
                                onTap: () {
                                  controller.changeKompleks(e);
                                  controller.changeindexpage(5);
                                  //controller.changeindexpage(1);
                                  controller.changeindextab(2);
                                },
                                child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            e.title!,
                                            style: TextStyle(
                                                fontFamily: UiJ.fontbold,
                                                color: Colors.grey[900],
                                                fontSize: MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        UiJ.widthSize
                                                    ? 30
                                                    : 20),
                                          ),
                                        ),
                                        Container(
                                            child: Card(
                                                elevation: 5,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.blue
                                                                .shade800)),
                                                    margin: EdgeInsets.all(10),
                                                    child: Image.network(
                                                      '${UiJ.url}kompleks/download/house/${e.mainimagepath}',
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                          exception,
                                                          stackTrace) {
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      },
                                                    ))))
                                      ],
                                    )));
                          });
                        }).toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height /
                              (UiJ.sizeweight(context) ? 1.4 : 1.3),
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.5,
                          initialPage: _current,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 5000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: (int? value, page) {
                            setState(() {
                              _current = value!;

                              // print("${_current}");
                            });
                          },
                          scrollDirection:
                              MediaQuery.of(context).size.width < 600
                                  ? Axis.vertical
                                  : Axis.horizontal,
                        ))),
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller.listKompleks.map(
                        (image) {
                          int index = controller.listKompleks.indexOf(image);
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  _current = index;
                                  carouselController.jumpToPage(index);
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 10,
                                margin: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: _current == index
                                        ? Colors.red
                                        : Colors.black,
                                    width: 1,
                                  ),
                                  color: _current == index
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              ));
                        },
                      ).toList(), // this was the part the I had to add
                    )),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //     height: MediaQuery.of(context).size.height,
                //     width: MediaQuery.of(context).size.width,
                //     child: NewsPage()),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //     height: MediaQuery.of(context).size.height,
                //     width: MediaQuery.of(context).size.width,
                //     child: CatalogMainPage()),
                // SizedBox(
                //   height: 10,
                // ),
              ],
            );
          });
  }
}
