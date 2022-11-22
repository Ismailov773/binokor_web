import 'dart:js';
import 'dart:ui';

import 'package:binokor_web/getconrollers/Controller.dart';
import 'package:binokor_web/models/Order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/Catalog.dart';
import '../models/uij.dart';

final Controller controller = Get.find();
late SourceMeneger sourceMeneger;
final GlobalKey _globalKeyOffer = GlobalKey<FormState>();
TextEditingController _fioController = TextEditingController();
TextEditingController _adressController = TextEditingController();
TextEditingController _phoneController = TextEditingController();

class ShopingBox extends StatelessWidget {
  const ShopingBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sourceMeneger = SourceMeneger(listOrder: controller.orderlist);
    //controller.changeSource(sourceMeneger);
    return ListView(

      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 100, right: 100),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      controller.changeindextab(0);
                      controller.changeindexpage(1);
                    },
                    icon: Icon(Icons.keyboard_arrow_left)),
                Text("Оформление заказа",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: UiJ.fontbold)),
              ],
            )),
        Divider(),
        controller.orderlist.length == 0
            ? Container()
            : Align(
                alignment: Alignment.topCenter,
                child: Text("Ваше заказы",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontFamily: UiJ.fontbold))),
        controller.orderlist.length == 0
            ? Container()
            : Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                child: dataGrid(),
              ),
        // SizedBox(
        //   height: 20,
        // ),
       Expanded(
           child:  otherParams(context)),
      ],
    );
  }

  Widget dataGrid() {
    return SfDataGridTheme(
        data: SfDataGridThemeData(
            headerColor: Colors.blue,
            rowHoverTextStyle: TextStyle(color: Colors.blue)),
        child: SfDataGrid(
          columnWidthMode: ColumnWidthMode.fill,
          selectionMode: SelectionMode.single,
          navigationMode: GridNavigationMode.cell,
          allowSorting: true,
          allowEditing: true,
          allowPullToRefresh: true,
          source: sourceMeneger,
          // onCellTap: (DataGridCellTapDetails newValue) {
          //   // dataGridonCellTap(newValue.rowColumnIndex.rowIndex - 1);
          // },
          columns: [
            GridColumn(
                columnName: "make",
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Изделия',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
            GridColumn(
                columnName: "name",
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Марка изделия',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
            GridColumn(
                columnName: "length",
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Длина',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
            GridColumn(
                columnName: "weigth",
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Щирина',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
            GridColumn(
                columnName: "heigth",
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Высота',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
            GridColumn(
                columnName: "volume",
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Объем',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
            GridColumn(
                columnName: "mass",
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Масса',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
            GridColumn(
                columnName: "concrete",
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text('Класс бетона',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)))),
            GridColumn(
                columnName: "count",
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Кол-во',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
          ],
        ));
  }

  Widget otherParams(BuildContext context) {
    return Container(
         alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 3,
            right: MediaQuery.of(context).size.width / 3),
        child: Form(
            key: _globalKeyOffer,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _fioController,
                  style: TextStyle(fontSize: 20, fontFamily: UiJ.fontbold),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      //Theme.of(context).backgroundColor,
                      prefix: Icon(Icons.man),
                      labelText: "Ф.И.О.",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Не заполнено поле Ф.И.О.!";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: TextStyle(fontSize: 20, fontFamily: UiJ.fontbold),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      //Theme.of(context).backgroundColor,
                      labelText: 'Телефон',
                      prefix: Icon(Icons.phone_android),
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Не заполнено поле Телефон!";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _adressController,
                  style: TextStyle(fontSize: 20, fontFamily: UiJ.fontbold),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      prefix: Icon(Icons.home),
//Theme.of(context).backgroundColor,
                      labelText: "Адрес доставки",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Не заполнено поле Ф.И.О.!";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 50,
                    child: ElevatedButton(
                    onPressed: () {


                    },
                    child: Text(
                      "Отправить заказать",
                      style: TextStyle(fontSize: 20, fontFamily: UiJ.font),
                    ))),
                SizedBox(
                  height: 20,
                ),
                Text("После отправки заказа Наши менеджеры свяжутся с Вами !",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.orange,
                        fontFamily: UiJ.font)),
              ],
            )));
  }
}

class SourceMeneger extends DataGridSource {
  dynamic newCellValue;

  int idx = 0;

  // TextEditingController editingController = TextEditingController();

  SourceMeneger({required List<Order> listOrder}) {
    _listDataRow = listOrder
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: "make", value: e.make!.name),
              DataGridCell<String>(columnName: "name", value: e.name),
              DataGridCell<String>(columnName: "length", value: e.length),
              DataGridCell<String>(columnName: "weigth", value: e.weigth),
              DataGridCell<String>(columnName: "heigth", value: e.heigth),
              DataGridCell<String>(columnName: "volume", value: e.volume),
              DataGridCell<String>(columnName: "mass", value: e.mass),
              DataGridCell<String>(columnName: "concrete", value: e.concrete),
              DataGridCell<int>(columnName: "count", value: e.count),
            ]))
        .toList();
  }

  List<DataGridRow> _listDataRow = [];

  List<DataGridRow> get rows => _listDataRow;

  @override
  void onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
      GridColumn column) {
    if (controller.orderlist[idx].count != null) {
      controller.orderlist[idx].count == null
          ? controller.orderlist[idx].count = 0
          : controller.orderlist[idx].count =
              (controller.orderlist[idx].count! + 1);
      //sourceMeneger = SourceMeneger(listOrder: controller.orderlist);

      // notifyListeners();
    }
    dataGridRow.getCells()[8] = DataGridCell(
        columnName: "count", value: controller.orderlist[idx].count);
    notifyListeners();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          row.getCells()[0].value.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(row.getCells()[1].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(row.getCells()[2].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(row.getCells()[3].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(row.getCells()[4].value.toString()),
      ),
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(row.getCells()[5].value.toString())),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(row.getCells()[6].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(row.getCells()[7].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
            // height: 80,
            // alignment: Alignment.bottomRight,
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 25,
                height: 25,
                child: FloatingActionButton(
                  onPressed: () {
                    if (controller.orderlist[idx].count != null) {
                      if (controller.orderlist[idx].count! > 0) {
                        controller.orderlist[idx].count == null
                            ? controller.orderlist[idx].count = 0
                            : controller.orderlist[idx].count =
                                (controller.orderlist[idx].count! - 1);
                        row.getCells()[8] = DataGridCell(
                            columnName: "count",
                            value: controller.orderlist[idx].count);
                        notifyListeners();
                      }
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 15,
                    color: Colors.white,
                  ),
                )),
            SizedBox(
              width: 15,
            ),
            Text(
              row.getCells()[8].value.toString(),
              style: TextStyle(
                fontFamily: UiJ.fontbold,
                fontSize: 15,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            SizedBox(
                width: 25,
                height: 25,
                child: FloatingActionButton(
                  onPressed: () {
                    if (controller.orderlist[idx].count != null) {
                      controller.orderlist[idx].count == null
                          ? controller.orderlist[idx].count = 0
                          : controller.orderlist[idx].count =
                              (controller.orderlist[idx].count! + 1);
                      row.getCells()[8] = DataGridCell(
                          columnName: "count",
                          value: controller.orderlist[idx].count);
                      notifyListeners();
                    }
                  },
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.white,
                  ),
                )),
            // SizedBox(
            //   width: 20,
            // ),
            // Container(
            //   height: 50,
            //     alignment:
            //         Alignment.center,
            //     child:
            //         ElevatedButton(
            //       onPressed: () {},
            //       child:
            //           Text("Заказать"),
            //     )),
          ],
        )),
      ),
    ]);
  }
}
