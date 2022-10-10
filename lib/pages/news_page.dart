import 'package:binokor_web/bloc/dsk_state.dart';
import 'package:binokor_web/bloc/news_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../models/News.dart';
import '../models/uij.dart';

List<News> _listnews = [];

DateFormat formattedDate = DateFormat('dd-MM-yyyy');

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, DskState>(
        builder: (context, state) {
          if (state is DskEmtyState) {
            return Center(child: Text("No data!"));
          }
          if (state is DskLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is NewsLoadedSatate) {
            _listnews = state.loadedNews;

            return Container(
                padding: EdgeInsets.only(left: 100, right: 100), child: main());
          }

          if (state is DskErrorState) {
            return Center(
              child: Text("Сервер не работает!"),
            );
          }
          return SizedBox.shrink();
        },
        listener: (context, state) {});
  }

  Widget main() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "Новости",
            style: TextStyle(
                fontFamily: UiJ.fontbold,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        SizedBox(
          height: 30,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: _listnews.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
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
                                                height: 300, errorBuilder:
                                                    (context, exception,
                                                        stackTrace) {
                                          return Center(
                                            child: CircularProgressIndicator(),
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
                                          formattedDate.format(DateTime.parse(
                                              _listnews[index].datacreate!)),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        alignment: Alignment.topRight,
                                      ),

                                      Container(
                                          child: Text(
                                        _listnews[index].title!,
                                        style: TextStyle(
                                            fontFamily: UiJ.fontbold,
                                            fontSize: 30),
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
                        )),
                        Divider()
                      ],
                    ),
                    onTap: () {
                      showDialogphoto(
                          context, "Фото новости", _listnews[index]);
                    },
                  );
                }))
      ],
    );
  }

  Future<void> showDialogphoto(
      BuildContext context, String title, News news) async {
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
              width: MediaQuery.of(context).size.width / 1.1,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: news.imagenews!.length > 2 ? 4 : 1),
                itemCount: news.imagenews!.length,
                itemBuilder: (context, idx) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            '${UiJ.url}news/download/imagenews/${news.imagenews![idx].imagepath}',
                            height: MediaQuery.of(context).size.height /
                                (news.imagenews!.length > 2 ? 4 : 2),
                            errorBuilder: (context, exception, stackTrace) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      Divider()
                    ],
                  );
                },
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
      },
    );
  }
}
