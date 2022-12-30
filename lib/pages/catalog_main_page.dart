import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../getconrollers/Controller.dart';
import '../models/Make.dart';
import '../models/uij.dart';

List<Make> _listMake = [];
// List<int> _listCounter = [];
final Controller controller = Get.find();

class CatalogMainPage extends StatelessWidget {
  const CatalogMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _listMake = controller.listMake;
    // _listCounter = List<int>.filled(_listMake.length, 0);

    return Obx(() {
      return Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 9,
                right: MediaQuery.of(context).size.width / 9),
            alignment: Alignment.topLeft,
            child: Text("Каталоги",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width > UiJ.widthSize
                        ? 30
                        : 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: UiJ.fontbold)),
          ),
          Divider(),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 9,
                      right: MediaQuery.of(context).size.width / 9),
                  child: GridView.builder(
                      itemCount: _listMake.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width > UiJ.widthSize
                                  ? 3
                                  : 1),
                      itemBuilder: (context, index) {
                        return StatefulBuilder(builder: (context, setState) {
                          return SizedBox(
                              height: MediaQuery.of(context).size.height / 20,
                              width: MediaQuery.of(context).size.width / 9,
                              child: InkWell(
                                  onTap: () {
                                    controller.changeMake(_listMake[index]);
                                    controller.changeindextab(0);
                                    controller.changeindexpage(6);
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blue.shade800)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.all(20),
                                                child: Text(
                                                  _listMake[index].name!,

                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width >
                                                                  UiJ.widthSize
                                                              ? 20
                                                              : 10,
                                                      fontFamily: UiJ.fontbold),
                                                  textAlign: TextAlign.start,
                                                )),
                                            Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.all(20),
                                                    child: Image.network(
                                                      _listMake[index] == null
                                                          ? ''
                                                          : '${UiJ.url}make/download/makes/${_listMake[index].imagepath}',
                                                      errorBuilder: (context,
                                                          exception,
                                                          stackTrace) {
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      },
                                                    ))),
                                          ],
                                        )),
                                  )));
                        });
                      }))),
        ],
      );
    });
  }
}
