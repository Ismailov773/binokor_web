import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hovering/hovering.dart';
import 'package:intl/intl.dart';

import '../getconrollers/Controller.dart';
import '../models/News.dart';
import '../models/uij.dart';

List<News> _listnews = [];
String imagepath = '';

DateFormat formattedDate = DateFormat('dd-MM-yyyy');

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.find();
    return Obx(() {
      _listnews = controller.listnews;
      return main(context);
    });
  }

  Widget main(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 100, right: 100),
            child: Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.topLeft,
              child: Text(
                "Новости",
                style: TextStyle(
                    fontFamily: UiJ.fontbold,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            )),
        Divider(),
        SizedBox(
          height: 30,
        ),
        MediaQuery.of(context).size.width > UiJ.widthSize
            ? listWeb(context)
            : listPhone(context)
      ],
    );
  }

  Widget listWeb(context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width > UiJ.widthSize
                    ? 100
                    : 20,
                right: MediaQuery.of(context).size.width > UiJ.widthSize
                    ? 100
                    : 20),
            child: ListView.builder(
                itemCount: _listnews.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HoverContainer(
                          hoverColor: UiJ.hovercolor,
                          cursor: MouseCursor.defer,
                          child: InkWell(
                            child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        // padding: EdgeInsets.only(left: 100, right: 100),
                                        // margin: EdgeInsets.all(20),
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
                                                        '${UiJ.url}news/download/news/${_listnews[index].imagepath}',
                                                        width: 500,
                                                        height: 300,
                                                        errorBuilder: (context,
                                                            exception,
                                                            stackTrace) {
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }))))),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  formattedDate.format(
                                                      DateTime.parse(
                                                          _listnews[index]
                                                              .datacreate!)),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: UiJ.fontbold),
                                                ),
                                                alignment: Alignment.topRight,
                                              ),

                                              Container(
                                                  child: Text(
                                                _listnews[index].title!,
                                                style: TextStyle(
                                                    fontFamily: UiJ.fontbold,
                                                    fontSize: 30,
                                                    color: Colors.indigoAccent),
                                              )),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                  _listnews[index].description!,
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      fontFamily: UiJ.font))
                                              // Spacer(),
                                            ])),
                                  ],
                                )),
                            onTap: () {
                              if (_listnews[index].imagenews!.length != 0) {
                                if (_listnews[index].imagenews!.length > 0) {
                                  imagepath =
                                      _listnews[index].imagenews![0].imagepath!;
                                }
                                showDialogphoto(context,
                                    _listnews[index].title!, _listnews[index]);
                              }
                            },
                          )),
                      Divider()
                    ],
                  );
                })));
  }

  Widget listPhone(context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
                itemCount: _listnews.length,
                itemBuilder: (context, index) {
                  return HoverContainer(
                      hoverColor: UiJ.hovercolor,
                      child: InkWell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
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
                                              '${UiJ.url}news/download/news/${_listnews[index].imagepath}',
                                              width: 500,
                                              height: 300, errorBuilder:
                                                  (context, exception,
                                                      stackTrace) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      })))),
                              SizedBox(
                                width: 50,
                              ),
                              Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                    Container(
                                      child: Text(
                                        formattedDate.format(DateTime.parse(
                                            _listnews[index].datacreate!)),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: UiJ.fontbold),
                                      ),
                                      alignment: Alignment.topRight,
                                    ),

                                    Container(
                                        child: Text(
                                      _listnews[index].title!,
                                      style: TextStyle(
                                          fontFamily: UiJ.fontbold,
                                          fontSize: 20,
                                          color: Colors.indigoAccent),
                                    )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(_listnews[index].description!,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w200,
                                            fontFamily: UiJ.font))
                                    // Spacer(),
                                  ])),
                            ],
                          ),
                          onTap: () {
                            if (_listnews[index].imagenews!.length != 0) {
                              if (_listnews[index].imagenews!.length > 0) {
                                imagepath =
                                    _listnews[index].imagenews![0].imagepath!;
                              }
                              showDialogphoto(context, _listnews[index].title!,
                                  _listnews[index]);
                            }
                          }));
                })));
  }

  Future<void> showDialogphoto(
      BuildContext context, String title, News news) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 25, fontFamily: UiJ.fontbold),
                ),
                Divider(),
              ],
            ),
            content: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: news.imagenews!.length,
                      itemBuilder: (context, idx) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                imagepath = news.imagenews![idx].imagepath!;
                              });
                            },
                            child: Card(
                                child: Container(
                              padding: EdgeInsets.all(10),
                              child: Image.network(
                                '${UiJ.url}news/download/imagenews/${news.imagenews![idx].imagepath}',
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 4,
                                errorBuilder: (context, exception, stackTrace) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                            )));
                      },
                    )),
                    VerticalDivider(),
                    Expanded(
                        flex: 3,
                        child: Card(
                            elevation: 5,
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: Image.network(
                                    '${UiJ.url}news/download/imagenews/${imagepath}',
                                    errorBuilder:
                                        (context, exception, stackTrace) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }))))
                  ],
                )),
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
        });
      },
    );
  }
}
