import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dsk_state.dart';
import '../bloc/meneger_bloc.dart';
import '../models/Meneger.dart';
import '../models/uij.dart';

List<Meneger> _list = [];

class MenegersPage extends StatelessWidget {
  const MenegersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenegerBloc, DskState>(
        builder: (context, state) {
          if (state is DskEmtyState) {
            return Center(child: Text("No data!"));
          }
          if (state is DskLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is MenegerLoadedState) {
            _list = state.loadedMeneger;

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
            "Руководство:",
            style: TextStyle(
                fontFamily: UiJ.fontbold,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        SizedBox(
          height: 50,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 100),
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
                                          '${UiJ.url}meneger/download/meneger/${_list[index].imagepath}',
                                          width: 300,
                                          height: 300,
                                           errorBuilder:
                                              (context, exception, stackTrace) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }))))),
                      SizedBox(
                        width: 150,
                      ),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                            Container(
                                child: Text(
                              _list[index].name!,
                              style: TextStyle(
                                  fontFamily: UiJ.fontbold, fontSize: 30),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "должность:  ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: UiJ.font)),
                                TextSpan(
                                    text: _list[index].post,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font))
                              ]),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.blue,
                                  ),
                                ),
                                TextSpan(
                                    text: "E-mail: ",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font,
                                        height: 2)),
                                TextSpan(
                                    text: "info@dsk.uz",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font))
                              ]),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.phone,
                                  color: Colors.blue,
                                )),
                                TextSpan(
                                    text: 'телефон: ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font,
                                        height: 2)),
                                TextSpan(
                                    text: '${UiJ.phone}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font,
                                        height: 2))
                              ]),
                            ),
                            // Spacer(),
                            Divider()
                          ])),
                    ],
                  ));
                }))
      ],
    );
  }
}
