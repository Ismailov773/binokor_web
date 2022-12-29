import 'dart:ui';

import 'package:binokor_web/getconrollers/ApiConnector.dart';
import 'package:binokor_web/getconrollers/Controller.dart';
import 'package:binokor_web/models/LightUser.dart';
import 'package:binokor_web/pages/catalog_main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/Catalog.dart';
import '../models/Orderb.dart';
import '../models/uij.dart';

final Controller controller = Get.find();
late SourceMeneger sourceMeneger;
final _globalKeyOffer = GlobalKey<FormState>();
TextEditingController _fioController = TextEditingController();
TextEditingController _adressController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
bool visible = false;

class ShopingBox extends StatelessWidget {
  const ShopingBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sourceMeneger = SourceMeneger(listOrder: controller.orderlist);
    //controller.changeSource(sourceMeneger);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width > UiJ.widthSize
                    ? 100
                    : 20,
                right: MediaQuery.of(context).size.width > UiJ.widthSize
                    ? 100
                    : 20),
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
                        fontSize:
                            MediaQuery.of(context).size.width > UiJ.widthSize
                                ? 30
                                : 15,
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
                        fontSize:
                            MediaQuery.of(context).size.width > UiJ.widthSize
                                ? 30
                                : 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontFamily: UiJ.fontbold))),
        SizedBox(
          height: 20,
        ),
        controller.orderlist.length == 0
            ? Container()
            : Expanded(
                child: Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width > UiJ.widthSize
                        ? 50
                        : 10,
                    right: MediaQuery.of(context).size.width > UiJ.widthSize
                        ? 50
                        : 10),
                child: dataGrid(),
              )),
        Expanded(flex: 3, child: otherParams(context)),
      ],
    );
  }

  Widget dataGrid() {
    return SfDataGridTheme(
        data: SfDataGridThemeData(
          headerColor: Colors.blue,
          rowHoverTextStyle: TextStyle(color: Colors.blue),
        ),
        child: SfDataGrid(
          columnWidthMode: ColumnWidthMode.fill,
          selectionMode: SelectionMode.single,
          navigationMode: GridNavigationMode.cell,
          // allowSorting: true,
          allowEditing: true,
          allowPullToRefresh: true,
          source: sourceMeneger,
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
    return StatefulBuilder(
        builder: (context, setState) => Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width > UiJ.widthSize ? 50 : 10,
                right: MediaQuery.of(context).size.width > UiJ.widthSize ? 20 : 10),
            child: Form(
                key: _globalKeyOffer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _fioController,
                      style: TextStyle(fontSize: 20, fontFamily: UiJ.fontbold),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          //Theme.of(context).backgroundColor,
                          prefix: Icon(Icons.man),
                          labelText: "Ф.И.О.",
                          labelStyle: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w200,
                              fontFamily: UiJ.font),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.blue))),
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
                          labelStyle: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w200,
                              fontFamily: UiJ.font),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.blue))),
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
                          labelStyle: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w200,
                              fontFamily: UiJ.font),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.blue))),
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
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),),
                            onPressed: () async {
                              if (visible != false) return;

                              if (!_globalKeyOffer.currentState!.validate()) {
                                return;
                              }
                              setState(() {
                                visible = true;
                              });
                              await Future.delayed(Duration(seconds: 2), () {
                                if (controller.orderlist == null) return;
                                LightUser lightuser = LightUser();
                                lightuser.orderList = controller.orderlist;
                                lightuser.phone = _phoneController.text;
                                lightuser.adress = _adressController.text;
                                lightuser.name = _fioController.text;
                                controller
                                    .postLightUser("ligthuser/save", lightuser)
                                    .then((value) {
                                  controller.orderlist.clear();
                                  _phoneController.clear();
                                  _adressController.clear();
                                  _fioController.clear();

                                  sourceMeneger._listDataRow = [];
                                  sourceMeneger.updateDataGridSource();
                                  //_globalKey.currentState!.refresh();

                                  // sourceMeneger._listDataRow = [];
                                  // _listDataRow = [];
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Ваше заявка принята Наше менеджеры свяжутся в течение 24 часов!")));

                                  setState(() {
                                    visible = false;
                                  });
                                });
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                visible
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Container(
                                        child: Text(
                                        "Отправить заказ",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width > UiJ.widthSize ? 20 : 15, fontFamily: UiJ.font),
                                      )),
                              ],
                            ))),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "После отправки заказа Наши менеджеры свяжутся с Вами !",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.orange,
                            fontFamily: UiJ.font)),
                  ],
                ))));
  }
}

class SourceMeneger extends DataGridSource {
  dynamic newCellValue;

  int idx = 0;

  // TextEditingController editingController = TextEditingController();

  SourceMeneger({required List<Orderb> listOrder}) {
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

  void updateDataGridSource() {
    notifyListeners();
  }

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
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          row.getCells()[1].value.toString(),
          style: TextStyle(color: Colors.blue),
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(row.getCells()[2].value.toString(),
            style: TextStyle(color: Colors.blue)),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(row.getCells()[3].value.toString(),
            style: TextStyle(color: Colors.blue)),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(row.getCells()[4].value.toString(),
            style: TextStyle(color: Colors.blue)),
      ),
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(row.getCells()[5].value.toString(),
              style: TextStyle(color: Colors.blue))),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(row.getCells()[6].value.toString(),
            style: TextStyle(color: Colors.blue)),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(row.getCells()[7].value.toString(),
            style: TextStyle(color: Colors.blue)),
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
          ],
        )),
      ),
    ]);
  }
}
