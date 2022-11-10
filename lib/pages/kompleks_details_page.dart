import 'package:binokor_web/getconrollers/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/uij.dart';

class KompleksDetailesPage extends StatefulWidget {
  KompleksDetailesPage({Key? key}) : super(key: key);

  @override
  State<KompleksDetailesPage> createState() => _KompleksDetailesPageState();
}

class _KompleksDetailesPageState extends State<KompleksDetailesPage>
    with TickerProviderStateMixin {
  final Controller controller = Get.put(Controller());

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 100, right: 100),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 50,
                  alignment: Alignment.topLeft,
                  child: Text(controller.kompleks!.title!,
                      style: TextStyle(
                          fontSize: UiJ.sizeweight(context) ? 20 : 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: UiJ.fontbold)),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(fontSize: 20),
                    tabs: [
                      Tab(
                        child: Text("Описание"),
                      ),
                      Tab(
                        child: Text("Проекты"),
                      ),
                      Tab(
                        child: Text("Процесс строительство"),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(controller: _tabController, children: [
                  Container(
                    color: Colors.amberAccent,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                ]))
              ],
            )));
  }

  Widget description() {
    return Column(
      children: [
        Container(
          child: Text(
            controller.kompleks!.description!,
            style: TextStyle(fontSize: 20, fontFamily: UiJ.fontbold),
          ),
        )
      ],
    );
  }
}
