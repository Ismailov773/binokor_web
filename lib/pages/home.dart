import 'package:binokor_web/getconrollers/Controller.dart';
import 'package:binokor_web/pages/catalog_main_page.dart';
import 'package:binokor_web/pages/job_page.dart';
import 'package:binokor_web/pages/kompleks_details_page1.dart';
import 'package:binokor_web/pages/production_page.dart';
import 'package:binokor_web/pages/shoping_box.dart';
import 'package:binokor_web/pages/study_page.dart';
import 'package:binokor_web/widgets/getDrawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/uij.dart';
import '../widgets/aboutMenu_dropdown.dart';

import 'catalog_page.dart';
import 'contact_page.dart';
import 'first_page.dart';
import 'kompleks_page.dart';
import 'menegers_page.dart';
import 'news_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final controller = Get.put(Controller());
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  Widget build(BuildContext context) {
    tabController.index = controller.indextab.toInt();
    return Obx(() => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
                MediaQuery.of(context).size.width > UiJ.widthSize
                    ? _scrollPosition == 0
                        ? 150
                        : 80
                    : 50),
            child: AppBar(
              backgroundColor: Colors.white,
              centerTitle: false,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black, size: 40),
              // scrolledUnderElevation: 10,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(left: 100),
                child: Row(children: [
                  // Container(
                  //     decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //           image: AssetImage('assets/images/backround.png'),
                  //           fit: BoxFit.cover,
                  //         ))),
                  InkWell(
                    onTap: () {
                      tabController.index = 0;
                      controller.changeindexpage(1);
                      controller.changeindextab(0);
                    },
                    child: Container(
                      child: Image.asset('assets/images/logo1.png'),
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.width / 9,
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width /
                        (UiJ.sizeweight(context) ? 17 : 10),
                  ),
                  // Spacer(),
                  MediaQuery.of(context).size.width < UiJ.widthSize
                      ? Container()
                      : TabBar(
                          controller: tabController,

                          indicatorColor: Colors.white,
                          labelColor: Colors.red,
                          unselectedLabelColor: Colors.black,
                          indicatorWeight: 1,
                          labelStyle: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 20 : 25,
                              fontFamily: UiJ.font),
                          isScrollable: true,

                          // indicator: Decoration(BoxPainter(paintBorder())),
                          onTap: (int idx) {
                            // setState(() {
                            //

                            // });
                            tabController.index = idx;
                            if (idx == 1) {
                              controller.changeindexpage(1);
                              controller.changeindextab(1);
                            } else if (idx == 0) {
                              controller.changeindexpage(1);
                              controller.changeindextab(0);
                            } else {
                              controller.changeindexpage(1);
                              controller.changeindextab(idx);
                            }
                          },

                          tabs: [
                            Container(
                                // width: 200,
                                child: Tab(
                              child: AboutMenu_DropDown(
                                vertical: false,
                              ),
                            )),
                            Container(
                              // width: 200,
                              child: Tab(
                                  child: Text(
                                'Каталоги',
                              )),
                            ),
                            Container(
                              // width: 200,
                              child: Tab(
                                  child: Text(
                                'Строительство',
                                style: TextStyle(
                                  fontFamily: UiJ.font,
                                ),
                              )),
                            ),
                            Container(
                              // width: 200,
                              child: Tab(
                                  child: Text(
                                'Производство',
                              )),
                            ),
                            Container(
                              // width: 200,
                              child: Tab(
                                  child: Text(
                                'Обучение',
                              )),
                            ),
                            Container(
                              // width: 200,
                              child: Tab(
                                  child: Text(
                                'Контакты',
                              )),
                            ),
                          ],
                        ),
                ]),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      controller.changeindextab(1);
                      controller.changeindexpage(7);
                    },
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.blue,
                      size: MediaQuery.of(context).size.width < UiJ.widthSize
                          ? 15
                          : 20,
                    )),
                Obx(() => Text(
                      controller.orderlist.length.toString(),
                      style: TextStyle(
                          fontFamily: UiJ.fontbold,
                          fontSize:
                              MediaQuery.of(context).size.width < UiJ.widthSize
                                  ? 20
                                  : 20,
                          color: Colors.orange),
                    )),
                TextButton(
                    onPressed: () {
                      controller.changeindextab(1);
                      controller.changeindexpage(7);
                    },
                    child: Text("Оформить \nзаказать",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: MediaQuery.of(context).size.width <
                                    UiJ.widthSize
                                ? 10
                                : 15,
                            fontFamily: UiJ.fontbold))),
              ],
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: MediaQuery.of(context).size.width < UiJ.widthSize
                      ? 20
                      : 45),
            ),
          ),
          body: Stack(fit: StackFit.expand, children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
              image: AssetImage('assets/images/backround.png'),
              fit: BoxFit.cover,
            ))),
            ListView(
              controller: _scrollController,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    child: selectionPage(controller.indexpage.value)),
                SizedBox(
                  height: 50,
                ),
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.only(left: 100, right: 100, top: 50),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Адрес компании:',
                                    style: TextStyle(
                                        fontSize:
                                            UiJ.sizeweight(context) ? 25 : 30,
                                        fontFamily: UiJ.fontbold,
                                        color: Colors.white)),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(Icons.location_on_rounded,
                                            color: Colors.blue)),
                                    TextSpan(
                                        text: '${UiJ.adress}',
                                        style: TextStyle(
                                            fontSize: UiJ.sizeweight(context)
                                                ? 20
                                                : 25,
                                            fontWeight: FontWeight.w200,
                                            fontFamily: UiJ.font,
                                            color: Colors.white))
                                  ]),
                                )
                              ])),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: '${UiJ.phone}  ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w200,
                                            fontFamily: UiJ.font,
                                            color: Colors.white)),
                                  ]),
                                )
                              ])),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                            onTap: () {
                              UiJ.callTelegram;
                            },
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.telegram,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: UiJ.telegram,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w200,
                                              fontFamily: UiJ.font,
                                              color: Colors.white))
                                    ]),
                                  )
                                ])),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                            onTap: () {
                              // UiJ.callTelegram;
                            },
                            child: Column(
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "info@dsk.uz",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200,
                                                  fontFamily: UiJ.font,
                                                  color: Colors.white))
                                        ]),
                                      ),
                                    ]),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Copyright © 2020 Template by DSK BINOKOR",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
          drawer: getDrawer(),
        ));
  }

  selectionPage(int page) {
    tabController.index = controller.indextab.toInt();

    switch (page) {
      case 1:
        return TabBarView(
          controller: tabController,
          children: [
            FirstPage(),
            CatalogMainPage(),
            KompleksPage(),
            ProductionPage(),
            StudyPage(),
            ContactPage(),
          ],
        );
      case 2:
        return MenegersPage();
      case 3:
        return NewsPage();
      case 4:
        return JobPage();
      case 5:
        return KompleksDetailesPage1();
      case 6:
        return CatalogPage();
      case 7:
        return ShopingBox();
    }
  }
}
