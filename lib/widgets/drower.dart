import 'package:binokor_web/bloc/make_bloc.dart';
import 'package:binokor_web/getconrollers/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../bloc/catalog_bloc.dart';
import '../bloc/dsk_event.dart';
import '../models/uij.dart';

String? dropname1;
CatalogBloc? catalogBloc;
List<String> listdrop = ['Руководство', 'Новости', 'Вакансии'];
MakeBloc? makeBloc;
final Controller controller = Get.put(Controller());

class DrowerPage extends StatelessWidget {
  const DrowerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
            // color: UiJ.color,
            child: DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.white,

                    // borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 0.5)),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/logo1.png',
                        width: 200,
                      ),
                    ),
                    // Container(
                    //     child: Text(
                    //   Ui.companyName,
                    //   style: TextStyle(fontSize: 25),
                  ],
                ))),
        // alignment: Alignment.centerLeft,
        ListTile(
          leading: Text(
            'О компаний',
            style: TextStyle(
                fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
          ),
          onTap: () {
            controller.changeindexpage(1);
            controller.changeindextab(0);
            Navigator.pop(context);
          },
        ),

        Divider(),
        ListTile(
          leading: Text(
            'Каталоги',
            style: TextStyle(
                fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
          ),
          onTap: () {
            controller.changeindexpage(1);
            controller.changeindextab(1);
            catalogBloc = BlocProvider.of<CatalogBloc>(context);
            catalogBloc?.add(DskLoadEvent());
            Navigator.pop(context);
          },
        ),
        Divider(),
        ListTile(
          leading: Text(
            'Строительство',
            style: TextStyle(
                fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
          ),
          onTap: () {
            controller.changeindexpage(1);
            controller.changeindextab(2);
            makeBloc = BlocProvider.of<MakeBloc>(context);
            makeBloc?.add(DskLoadEvent());
            Navigator.pop(context);
          },
        ),
        Divider(),

        ListTile(
          leading: Text(
            'Производство',
            style: TextStyle(
                fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
          ),
          onTap: () {
            controller.changeindexpage(1);
            controller.changeindextab(3);

            Navigator.pop(context);
          },
        ),
        Divider(),

        ListTile(
          leading: Text(
            'Обучение',
            style: TextStyle(
                fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
          ),
          onTap: () {
            controller.changeindexpage(1);
            controller.changeindextab(4);

            Navigator.pop(context);
          },
        ),
        Divider(),
        ListTile(
          leading: Text(
            'Контакты',
            style: TextStyle(
                fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
          ),
          onTap: () {
            controller.changeindexpage(1);
            controller.changeindextab(5);
            Navigator.pop(context);
          },
        ),
        Divider(),
        ListTile(
          leading: Text(
            'Обратная связь',
            style: TextStyle(
                fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
          ),
          onTap: () {},
        ),
      ],
    ));
  }
}
