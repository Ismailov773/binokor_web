import 'package:binokor_web/bloc/dsk_state.dart';
import 'package:binokor_web/bloc/news_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/News.dart';
import '../models/uij.dart';

List<News> _listnews = [];

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
                  return Container(
                      child: Row(
                    children: [
                      Container(
                          // padding: EdgeInsets.only(left: 100, right: 100),
                          margin: EdgeInsets.all(20),
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
                                              (context, exception, stackTrace) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }))))),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                            Container(
                                child: Text(
                              _listnews[index].title!,
                              style: TextStyle(
                                  fontFamily: UiJ.fontbold, fontSize: 30),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                // TextSpan(
                                //     text: "должность:  ",
                                //     style: TextStyle(
                                //         fontSize: 20,
                                //         fontWeight: FontWeight.bold,
                                //         fontFamily: UiJ.font)),
                                TextSpan(
                                    text: _listnews[index].description,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font))
                              ]),
                            ),
                            // Spacer(),
                            Divider(),
                          ])),
                    ],
                  ));
                }))
      ],
    );
  }
}
