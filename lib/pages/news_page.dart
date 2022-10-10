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
                  return Column(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  );
                }))
      ],
    );
  }
}
