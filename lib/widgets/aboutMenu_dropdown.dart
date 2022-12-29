import 'package:binokor_web/getconrollers/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/uij.dart';

enum Menu { About, Menegers, News, Vacansy }

class AboutMenu_DropDown extends StatefulWidget {
  final bool vertical;

  const AboutMenu_DropDown({required this.vertical}) : super();

  @override
  State<AboutMenu_DropDown> createState() => _AboutMenu_DropDownState();
}

class _AboutMenu_DropDownState extends State<AboutMenu_DropDown> {
  String? dropname1;

  bool isHovered = false;
  late bool vertical;
  final Controller controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    vertical = widget.vertical;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
        position: PopupMenuPosition.under,
        elevation: 5,
        offset: const Offset(0, 20),

        // icon: Icon(Icons.arrow_drop_down),
        //iconSize: 20,
        child: Row(children: [
          Text(
            "О Компании",
            style: TextStyle(fontSize: UiJ.sizeweight(context) ? 20 : 25),
          ),
          Icon(Icons.arrow_drop_down)
        ]),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              PopupMenuItem(
                  onTap: () {
                    controller.changeindexpage(2);
                    controller.changeindextab(0);
                    ;
                  },
                  textStyle:
                      TextStyle(fontSize: UiJ.sizeweight(context) ? 20 : 25),
                  value: Menu.Menegers,
                  child: Text("Руководство",
                      style: TextStyle(
                          fontSize: UiJ.sizeweight(context) ? 20 : 25,
                          fontFamily: UiJ.font,
                          color: Colors.black))),
              PopupMenuItem(
                  textStyle: TextStyle(fontSize: 20),
                  onTap: () {
                    controller.changeindexpage(3);
                    controller.changeindextab(0);
                  },
                  value: Menu.News,
                  child: Text("Новости",
                      style: TextStyle(
                          fontSize: UiJ.sizeweight(context) ? 20 : 25,
                          fontFamily: UiJ.font,
                          color: Colors.black))),
              PopupMenuItem(
                  textStyle: TextStyle(fontSize: 20),
                  onTap: () {
                    controller.changeindexpage(4);
                    controller.changeindextab(0);
                  },
                  value: Menu.Vacansy,
                  child: Text("Вакансия",
                      style: TextStyle(
                          fontSize: UiJ.sizeweight(context) ? 20 : 25,
                          fontFamily: UiJ.font,
                          color: Colors.black))),
            ]);
  }
}
