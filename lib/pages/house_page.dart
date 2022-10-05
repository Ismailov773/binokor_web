import 'dart:html';
import 'dart:js';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/dsk_state.dart';
import '../bloc/house_bloc.dart';
import '../models/House.dart';
import '../models/uij.dart';

List<House> _list = [];
DateFormat formattedDate = DateFormat('dd-MM-yyyy');

class HousePage extends StatelessWidget {
  const HousePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HouseBloc, DskState>(
        builder: (context, state) {
          if (state is DskEmtyState) {
            return Center(child: Text("No data!"));
          }
          if (state is DskLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HouseLoadedSatate) {
            _list = state.loadedHouse;
            if (_list.length != 0) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 100, right: 100),
                child: main(),
              );
            }
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          alignment: Alignment.topLeft,
          child: Text("Строительство",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  fontFamily: UiJ.font)),
        ),
        Divider(),
        SizedBox(
          height: 20,
        ),
        Expanded(child: mainPage()),
      ],
    );
  }

  Widget mainPage() {
    return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return Container(
              child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Card(
                          elevation: 5,
                          child: Image.network(
                              '${UiJ.url}house/download/house/${_list[index].mainimagepath}'))),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(_list[index].typehouse!,
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
                            child: Text(_list[index].title!,
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: UiJ.fontbold)),
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // padding: EdgeInsets.only(right: 400),
                            child: Text(_list[index].description!,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Times New Roman')),
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(right: 400),
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
                                          _list[index].dateproject!)),
                                      style: TextStyle(
                                          fontFamily: UiJ.font, fontSize: 20))
                                ]),
                              )),
                          Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(right: 400),
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
                                      text: _list[index].customer!,
                                      style: TextStyle(
                                          fontFamily: UiJ.font, fontSize: 20))
                                ]),
                              )),
                          Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(right: 400),
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
                                      style: TextStyle(
                                          fontFamily: UiJ.font, fontSize: 20))
                                ]),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Приобрести квартиру",
                                    style: TextStyle(
                                        fontFamily: UiJ.font, fontSize: 20),
                                  )))
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider()
            ],
          ));
        });
  }
}
