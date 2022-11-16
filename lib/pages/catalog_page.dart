import 'package:binokor_web/getconrollers/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/Catalog.dart';
import '../models/Make.dart';
import '../models/uij.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List<Catalog> _listCatalog = [];
  List<Make> _listMake = [];
  Make? _make;

  // Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    // _tabcontroller = TabController(length: 2, vsync: this);
    final Controller controller = Get.find();
    return Obx(() {
      _listMake = controller.listMake;
      _listMake.sort((a, b) => a.id!.compareTo(b.id!));
      if (_listMake.length > 0) {
        _make = _listMake.first;
      }
      return Padding(
        padding: EdgeInsets.only(left: 100, right: 100),
        child: main(),
      );
    });
  }

  Widget main() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text("Каталоги",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: UiJ.fontbold)),
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
    return StatefulBuilder(builder: (context, setState) {
      return Row(
        children: [
          Expanded(
              child: _listMake == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      children: _listMake.map((e) {
                        return InkWell(
                            // onHover: (bool value){
                            //
                            //   // if(value){
                            //   //   color = Colors.red;
                            //   // }else{
                            //   //   color = Colors.yellow;
                            //   // }
                            // },
                            onTap: () {
                              setState(() {
                                _make = e;
                                _listCatalog = e.catalogs!;
                              });
                            },
                            child: Container(
                              child: Card(
                                  elevation: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(20),
                                      color: _make == e
                                          ? Colors.greenAccent.shade100
                                          : Colors.white,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            child: Image.network(
                                              _make == null
                                                  ? ''
                                                  : '${UiJ.url}make/download/makes/${_make!.imagepath}',
                                              width: 50,
                                              height: 50,
                                              errorBuilder: (context, exception,
                                                  stackTrace) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Text(
                                            e.name!,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                // color: color,
                                                fontFamily: UiJ.fontbold,
                                                fontSize: 20),
                                          ))
                                        ],
                                      ))),
                            ));
                      }).toList(),
                    )),
          VerticalDivider(),
          Expanded(
            flex: 3,
            child: rightside(),
          ),
        ],
      );
    });
  }

  Widget rightside() {
    return DefaultTabController(
        length: 2,
        child: _make == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                //
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Text(
                        _make!.name!,
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                            // color: color,
                            fontFamily: UiJ.font,
                            fontSize: 20),
                      )),
                  Container(
                    height: 350,
                    child: Image.network(
                      _make == null
                          ? ''
                          : '${UiJ.url}make/download/makes/${_make!.imagepath}',
                      width: 350,
                      height: 350,
                      errorBuilder: (context, exception, stackTrace) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TabBar(
                        // controller: _tabcontroller,
                        labelColor: Colors.red,
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(
                            fontSize: UiJ.sizeweight(context) ? 15 : 20,
                            fontFamily: UiJ.font),
                        indicatorColor: Colors.white,
                        isScrollable: false,
                        tabs: [
                          Tab(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.view_module,
                                  size: UiJ.sizeweight(context) ? 30 : 50,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Характеристики")
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.view_list,
                                  size: UiJ.sizeweight(context) ? 30 : 50,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Описание")
                              ],
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: TabBarView(
                      // controller: _tabcontroller,
                      children: [
                        datatable(),
                        description(),
                      ],
                    ),
                  ),
                  // SizedBox(height: 200,)
                ],
              ));
  }

  Widget datatable() {
    return Container(
        child: SingleChildScrollView(
      child: _listCatalog == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : DataTable(
              headingTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: UiJ.sizeweight(context) ? 13 : 20,
                  fontFamily: UiJ.font),

              horizontalMargin: 3,
              // headingRowHeight: 100,
              columns: [
                DataColumn(
                    label: Center(
                        child: Text(
                  "Марка изделия",
                ))),
                DataColumn(label: Center(child: Text("Длина"))),
                DataColumn(label: Center(child: Text("Ширина"))),
                DataColumn(label: Center(child: Text("Высота"))),
                DataColumn(label: Center(child: Text("Объём, м3"))),
                DataColumn(label: Center(child: Text("Масса, т"))),
                DataColumn(label: Center(child: Text("Класс бетона")))
              ],
              rows: _listCatalog.map((e) {
                return DataRow(cells: [
                  DataCell(Center(
                      child: Text(
                    e.name!,
                    style: TextStyle(
                        fontSize: UiJ.sizeweight(context) ? 15 : 20,
                        fontFamily: UiJ.font),
                  ))),
                  DataCell(Center(
                      child: Text(
                    e.length!,
                    style: TextStyle(
                        fontSize: UiJ.sizeweight(context) ? 15 : 20,
                        fontFamily: UiJ.font),
                    textAlign: TextAlign.center,
                  ))),
                  DataCell(Center(
                      child: Text(e.weigth!,
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 15 : 20,
                              fontFamily: UiJ.font)))),
                  DataCell(Center(
                      child: Text(e.heigth!,
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 15 : 20,
                              fontFamily: UiJ.font)))),
                  DataCell(Center(
                      child: Text(e.volume!,
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 15 : 20,
                              fontFamily: UiJ.font)))),
                  DataCell(Center(
                      child: Text(e.mass!,
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 15 : 20,
                              fontFamily: UiJ.font)))),
                  DataCell(Center(
                      child: Text(e.concrete!,
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 15 : 20,
                              fontFamily: UiJ.font)))),
                ]);
              }).toList(),
            ),
    ));
  }

  Widget description() {
    return Container(
      // padding: EdgeInsets.all(20),
      child: Text(
        _make!.description!,
        style: TextStyle(
            fontFamily: UiJ.font,
            fontSize: UiJ.sizeweight(context) ? 20 : 25,
            fontStyle: FontStyle.italic),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
