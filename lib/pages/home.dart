import 'package:binokor_web/pages/imagecatalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../bloc/catalog_bloc.dart';
import '../bloc/dsk_event.dart';
import '../models/uij.dart';
import '../provider/simple_provider.dart';
import '../widgets/aboutMenu_dropdown.dart';
import '../widgets/drower.dart';
import 'catalog_page.dart';
import 'contact_page.dart';
import 'first_page.dart';
import 'house_page.dart';
import 'menegers_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late CatalogBloc catalogBloc;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    catalogBloc = BlocProvider.of<CatalogBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    tabController.index = context.watch<SimpleProvider>().getindextab;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            elevation: 0,
            flexibleSpace: Padding(
              padding: EdgeInsets.only(left: 100),
              child: Row(children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Image.asset('assets/images/logo1.png'),
                    width: 200,
                    height: 150,
                  ),
                ),
                Spacer(),
                TabBar(
                  controller: tabController,
                  indicatorColor: Colors.white,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 1,
                  isScrollable: true,

                  // indicator: Decoration(BoxPainter(paintBorder())),
                  onTap: (int idx) {
                    // setState(() {
                    //

                    // });
                    tabController.index = idx;
                    if (idx == 1) {
                      catalogBloc.add(DskLoadEvent());
                    }
                    context.read<SimpleProvider>().changeindextab(idx);
                    context.read<SimpleProvider>().changeindexpage(1);
                  },

                  tabs: [
                    Container(
                        width: 200,
                        child: Tab(
                            child: AboutMenu_DropDown(
                          vertical: false,
                        ))),
                    Container(
                      width: 200,
                      child: Tab(
                          child: Text('Каталоги',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: UiJ.font,
                                 ))),
                    ),
                    Container(
                      width: 200,
                      child: Tab(
                          child: Text(
                        'Строительство',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: UiJ.font,
                            ),
                      )),
                    ),
                    Container(
                      width: 200,
                      child: Tab(
                          child: Text(
                        'Производство',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: UiJ.font,
                            ),
                      )),
                    ),
                    Container(
                      width: 200,
                      child: Tab(
                          child: Text(
                        'Контакты',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: UiJ.font,
                            ),
                      )),
                    ),
                    // Wrap(
                    //     direction: Axis.horizontal,
                    //     children: [
                    //       Text("Личный кабинет",
                    //           style: TextStyle(
                    //               fontSize: 25,
                    //               fontFamily: UiJ.font,
                    //               color: Colors.black)),
                    //       // IconButton(
                    //       //   onPressed: () {},
                    //       //   icon: Icon(
                    //       //     Icons.person,
                    //       //     color: Colors.black,
                    //       //     size: 50,
                    //       //   ),
                    //       // ),
                    //     ],
                    //   ),
                  ],
                ),
              ]),
            ),
            actions: [],
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.w200, fontSize: 45),
          ),
        ),
        body: selectionPage(context.watch<SimpleProvider>().getindexpage),
        drawer: DrowerPage());
  }

  selectionPage(int page) {
    switch (page) {
      case 1:
        return TabBarView(
          controller: tabController,
          children: [
            FirstPage(),
            CatalogPage(),
            HousePage(),
            Container(),
            ContactPage(),
          ],
        );
      case 2:
        return MenegersPage();
      case 3:
        return ImageCatalogPage();
    }
  }
}
