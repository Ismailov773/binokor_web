import 'package:binokor_web/getconrollers/Controller.dart';
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

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List<Catalog> _listCatalog = [];
  final Controller controller = Get.find();
  final _globalKey = GlobalKey<FormState>();
  TextEditingController _lengthController = TextEditingController();
  TextEditingController _heigthController = TextEditingController();
  TextEditingController _widthController = TextEditingController();

  // TextEditingController _quantityController = TextEditingController();
  int count = 0;
  late SourceMeneger sourceMeneger;
  Catalog? _catalog;
  String _catalogname = "";

  @override
  void initState() {
    super.initState();
    _listCatalog = controller.make!.catalogs!;
    sourceMeneger = SourceMeneger(listCatalog: _listCatalog);
  } // Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    // _tabcontroller = TabController(length: 2, vsync: this);
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width > UiJ.widthSize ? 100 : 20,
          right: MediaQuery.of(context).size.width > UiJ.widthSize ? 100 : 20),
      child: main(),
    );
  }

  Widget main() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      controller.changeindextab(1);
                      controller.changeindexpage(1);
                    },
                    icon: Icon(Icons.keyboard_arrow_left)),
                Text("Каталоги",
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
            flex: 3,
            child: rightside(),
          ),
          VerticalDivider(),
          applyOrder(),
        ],
      );
    });
  }

  void dataGridonCellTap(int index) {
    setState(() {
      _catalog = _listCatalog[index];
      _catalogname = _catalog!.name!;
    });
    _lengthController.text = _listCatalog[index].length!;
    _widthController.text = _listCatalog[index].weigth!;
    _heigthController.text = _listCatalog[index].heigth!;
  }

  Widget applyOrder() {
    return Expanded(
        child: Form(
            key: _globalKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Форма заказа",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontFamily: UiJ.fontbold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '${controller.make == null ? "" : controller.make!.name}',
                  style: TextStyle(fontSize: 20, fontFamily: UiJ.fontbold),
                ),
                SizedBox(
                  height: 20,
                ),
                _catalog == null
                    ? Container()
                    : Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Марка изделия:',
                              style: TextStyle(fontSize: 15)),
                          WidgetSpan(
                              child: SizedBox(
                            width: 10,
                          )),
                          TextSpan(
                            text: '${_catalogname}',
                            style: TextStyle(
                                fontSize: 20, fontFamily: UiJ.fontbold),
                          ),
                        ]))),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _lengthController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      //Theme.of(context).backgroundColor,
                      labelText: "Длина",
                      labelStyle: TextStyle(color: Colors.blue),
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
                      return "Не заполнено поле Длина!";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _widthController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      //Theme.of(context).backgroundColor,
                      labelText: "Ширина",
                      labelStyle: TextStyle(color: Colors.blue),
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
                      return "Не заполнено поле Ширина!";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _heigthController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      //Theme.of(context).backgroundColor,
                      labelText: "Высота",
                      labelStyle: TextStyle(color: Colors.blue),
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
                      return "Не заполнено поле Высота!";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    // height: 80,
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Кол-во",
                          style: TextStyle(
                            fontFamily: UiJ.fontbold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: 30,
                            height: 30,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (count > 0) {
                                    count--;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 20,
                                color: Colors.white,
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          count.toString(),
                          style: TextStyle(
                            fontFamily: UiJ.fontbold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: 30,
                            height: 30,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  count++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 20,
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
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (!_globalKey.currentState!.validate()) {
                            return;
                          }

                          if (count == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Просим заполнить количество!")));
                            return;
                          }
                          Orderb order = Orderb();
                          order.make = controller.make;
                          order.name = _catalog!.name;
                          order.length = _lengthController.text;
                          order.heigth = _heigthController.text;
                          order.weigth = _widthController.text;
                          order.volume = _catalog!.volume;
                          order.mass = _catalog!.mass;
                          order.concrete = _catalog!.concrete;
                          order.count = count;

                          controller.addOrder(order);

                          _lengthController.clear();
                          _heigthController.clear();
                          _widthController.clear();
                          setState(() {
                            _catalogname = "";
                            count = 0;
                          });
                        },
                        child: Text(
                          "В Корзину",
                          style:
                              TextStyle(fontFamily: UiJ.fontbold, fontSize: 20),
                        )))
              ],
            )));
  }

  Widget rightside() {
    return DefaultTabController(
        length: 2,
        child: controller.make == null
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
                        controller.make!.name!,
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                            // color: color,
                            fontFamily: UiJ.fontbold,
                            fontSize: 20),
                      )),
                  SizedBox(
                    height: 50,
                    child: TabBar(
                        // controller: _tabcontroller,
                        labelColor: Colors.red,
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(
                            fontSize: UiJ.sizeweight(context) ? 20 : 25,
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
                        ]),
                  ),
                  Expanded(
                    child: TabBarView(
                      // controller: _tabcontroller,
                      children: [
                        description(),
                        datatable(),
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
                : SfDataGridTheme(
                    data: SfDataGridThemeData(
                        headerColor: Colors.blue,
                        rowHoverTextStyle: TextStyle(color: Colors.blue)),
                    child: SfDataGrid(
                      columnWidthMode: ColumnWidthMode.fill,
                      selectionMode: SelectionMode.single,
                      navigationMode: GridNavigationMode.cell,
                      // allowSorting: true,
                      source: sourceMeneger,
                      onCellTap: (DataGridCellTapDetails newValue) {
                        dataGridonCellTap(newValue.rowColumnIndex.rowIndex - 1);
                      },
                      columns: [
                        GridColumn(
                            columnName: "length",
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Марка изделия',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                        GridColumn(
                            columnName: "length",
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Длина',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                        GridColumn(
                            columnName: "weigth",
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Щирина',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                        GridColumn(
                            columnName: "heigth",
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Высота',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                        GridColumn(
                            columnName: "volume",
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Объем',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                        GridColumn(
                            columnName: "mass",
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Масса',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                        GridColumn(
                            columnName: "concrete",
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Класс бетона',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ],
                    ))));
  }

  Widget description() {
    return Container(
        // padding: EdgeInsets.all(20),
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  controller.make!.description!,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: UiJ.font,
                      fontSize: UiJ.sizeweight(context) ? 20 : 25,
                      fontStyle: FontStyle.italic),
                ))),
        VerticalDivider(),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Image.network(
                controller.make == null
                    ? ''
                    : '${UiJ.url}make/download/makes/${controller.make!.imagepath}',
                errorBuilder: (context, exception, stackTrace) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )),
        ),
      ],
    ));
  }
}

class SourceMeneger extends DataGridSource {
  dynamic newCellValue;
  TextEditingController editingController = TextEditingController();

  SourceMeneger({required List<Catalog> listCatalog}) {
    _listDataRow = listCatalog
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: "name", value: e.name),
              DataGridCell<String>(columnName: "length", value: e.length),
              DataGridCell<String>(columnName: "weigth", value: e.weigth),
              DataGridCell<String>(columnName: "heigth", value: e.heigth),
              DataGridCell<String>(columnName: "volume", value: e.volume),
              DataGridCell<String>(columnName: "mass", value: e.mass),
              DataGridCell<String>(columnName: "concrete", value: e.concrete),
            ]))
        .toList();
  }

  List<DataGridRow> _listDataRow = [];

  List<DataGridRow> get rows => _listDataRow;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(row.getCells()[0].value.toString()),
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
    ]);
  }
}
