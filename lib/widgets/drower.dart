import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../bloc/catalog_bloc.dart';
import '../bloc/dsk_event.dart';
import '../models/uij.dart';
import '../provider/simple_provider.dart';

String? dropname1;
CatalogBloc? catalogBloc;
List<String> listdrop = ['Руководство', 'Новости', 'Вакансии'];

class DrowerPage extends StatelessWidget {
  const DrowerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
            color: UiJ.color,
            child: DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.black54,

                    // borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 0.5)),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/logo.png',
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
          onTap: () {},
        ),

        Divider(),
        ListTile(
          leading: Text(
            'Каталоги',
            style: TextStyle(
                fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
          ),
          onTap: () {
            context.read<SimpleProvider>().changeindexpage(1);
            context.read<SimpleProvider>().changeindextab(1);
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
          onTap: () {},
        ),
        Divider(),

        ListTile(
          leading: Text(
            'Производство',
            style: TextStyle(
                fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
          ),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Text(
            'Контакты',
            style: TextStyle(
                fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
          ),
          onTap: () {
            context.read<SimpleProvider>().changeindexpage(1);
            context.read<SimpleProvider>().changeindextab(4);
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
