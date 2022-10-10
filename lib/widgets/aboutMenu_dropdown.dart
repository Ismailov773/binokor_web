import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/uij.dart';
import '../provider/simple_provider.dart';

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

  @override
  void initState() {
    super.initState();
    vertical = widget.vertical;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
        position: PopupMenuPosition.under,
        elevation: 0,
        offset: const Offset(0, 20),
        // onSelected: (Menu menu) {
        //   if(Menu.About == menu){
        //     context.read<SimpleProvider>().changeindexpage(1);
        //     context.read<SimpleProvider>().changeindextab(0);
        //   }
        // },
        child: Text(
          "О Компании",
          style: TextStyle(fontSize: UiJ.sizeweight(context) ? 20 : 25),
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              PopupMenuItem(
                  onTap: () {
                    context.read<SimpleProvider>().changeindexpage(2);
                    context.read<SimpleProvider>().changeindextab(0);
                  },
                  textStyle:
                      TextStyle(fontSize: UiJ.sizeweight(context) ? 20 : 25),
                  value: Menu.Menegers,
                  child: Text("Руководство",
                      style: TextStyle(
                          fontSize: UiJ.sizeweight(context) ? 20 : 25,
                          // fontFamily: UiJ.fontbold,
                          color: Colors.black))),
              PopupMenuItem(
                  textStyle: TextStyle(fontSize: 20),
                  onTap: () {
                    context.read<SimpleProvider>().changeindexpage(3);
                    context.read<SimpleProvider>().changeindextab(0);
                  },
                  value: Menu.News,
                  child: Text("Новости",
                      style: TextStyle(
                          fontSize: UiJ.sizeweight(context) ? 20 : 25,
                          // fontFamily: UiJ.fontbold,
                          color: Colors.black))),
              PopupMenuItem(
                  textStyle: TextStyle(fontSize: 20),
                  value: Menu.Vacansy,
                  child: Text("Вакансия",
                      style: TextStyle(
                          fontSize: UiJ.sizeweight(context) ? 20 : 25,
                          // fontFamily: UiJ.fontbold,
                          color: Colors.black))),
            ]);
  }
}
