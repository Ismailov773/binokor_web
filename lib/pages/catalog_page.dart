import 'dart:convert';
import 'package:binokor_web/provider/simple_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository.dart';
import '../bloc/catalog_bloc.dart';
import '../bloc/dsk_state.dart';
import '../bloc/make_bloc.dart';
import '../models/Catalog.dart';
import '../models/Make.dart';
import '../models/uij.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  // List<Catalog> _listCatalog = [];
  List<Make> _listMake = [];

  Make? _make;

  // Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    // _tabcontroller = TabController(length: 2, vsync: this);

    return BlocConsumer<MakeBloc, DskState>(
        builder: (context, state) {
          if (state is DskEmtyState) {
            return Center(child: Text("No data!"));
          }
          if (state is DskLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is MakeLoadedState) {
            _listMake = state.loadedMake;
            _listMake.sort((a, b) => a.id!.compareTo(b.id!));

            if (_listMake.length > 0) {
              _make = _listMake[2];
            }

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
              child: ListView(
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
                    });
                  },
                  child: Container(
                    child: Card(
                        elevation: 1,
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  child: Image.network(
                                    '${UiJ.url}make/download/makes/${_make!.imagepath}',
                                    width: 50,
                                    height: 50,
                                    errorBuilder:
                                        (context, exception, stackTrace) {
                                      return Center(
                                        child: CircularProgressIndicator(),
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
        child: Column(
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
                '${UiJ.url}make/download/makes/${_make!.imagepath}',
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
                  labelStyle: TextStyle(fontSize: 25, fontFamily: UiJ.font),
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
                            size: 50,
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
                            size: 50,
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
      child: DataTable(
        headingTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: UiJ.fontbold),
        columns: [
          DataColumn(label: Text("Марка изделия")),
          DataColumn(label: Text("Длина")),
          DataColumn(label: Text("Ширина")),
          DataColumn(label: Text("Высота")),
          DataColumn(label: Text("Объём, м3")),
          DataColumn(label: Text("Масса, т")),
          DataColumn(label: Text("Класс бетона"))
        ],
        rows: _make!.catalogs!.map((e) {
          return DataRow(cells: [
            DataCell(Text(
              e.name!,
              style: TextStyle(fontSize: 20, fontFamily: UiJ.font),
            )),
            DataCell(Text(e.length!,
                style: TextStyle(fontSize: 20, fontFamily: UiJ.font))),
            DataCell(Text(e.weigth!,
                style: TextStyle(fontSize: 20, fontFamily: UiJ.font))),
            DataCell(Text(e.heigth!,
                style: TextStyle(fontSize: 20, fontFamily: UiJ.font))),
            DataCell(Text(e.volume!,
                style: TextStyle(fontSize: 20, fontFamily: UiJ.font))),
            DataCell(Text(e.mass!,
                style: TextStyle(fontSize: 20, fontFamily: UiJ.font))),
            DataCell(Text(e.concrete!,
                style: TextStyle(fontSize: 20, fontFamily: UiJ.font))),
          ]);
        }).toList(),
      ),
    ));
  }

  Widget description() {
    return Center(
      // padding: EdgeInsets.all(20),
      child: Text(
        _make!.description!,
        style: TextStyle(
            fontFamily: UiJ.font, fontSize: 25, fontStyle: FontStyle.italic),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
