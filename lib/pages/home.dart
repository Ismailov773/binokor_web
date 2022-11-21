import 'package:binokor_web/getconrollers/Controller.dart';
import 'package:binokor_web/pages/catalog_main_page.dart';
import 'package:binokor_web/pages/job_page.dart';
import 'package:binokor_web/pages/kompleks_details_page.dart';
import 'package:binokor_web/pages/production_page.dart';
import 'package:binokor_web/pages/study_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/uij.dart';
import '../widgets/aboutMenu_dropdown.dart';
import '../widgets/drower.dart';
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

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    tabController.index = controller.indextab.toInt();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black, size: 40),
          flexibleSpace: Padding(
            padding: EdgeInsets.only(left: 100),
            child: Row(children: [
              InkWell(
                onTap: () {
                  tabController.index = 0;
                  controller.changeindexpage(1);
                  controller.changeindextab(0);

                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //
                  //   return Home();
                  // }));
                },
                child: Container(
                  child: Image.asset('assets/images/logo1.png'),
                  width: 200,
                  height: 150,
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width /
                    (UiJ.sizeweight(context) ? 17 : 10),
              ),
              // Spacer(),
              TabBar(
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
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.blue,
                  size: 50,
                )),
            Text(
              controller.orderlist.length.toString(),
              style: TextStyle(
                  fontFamily: UiJ.fontbold, fontSize: 20, color: Colors.orange),
            ),
            TextButton(
                onPressed: () {},
                child: Text("Оформить \nзаказать",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontFamily: UiJ.fontbold))),
          ],
          titleTextStyle: TextStyle(fontWeight: FontWeight.w200, fontSize: 45),
        ),
      ),
      body: Obx(() => ListView(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  child: selectionPage(controller.indexpage.value)),
              //,
              // KompleksPage(),
              SizedBox(
                height: 50,
              ),
              // CatalogPage(),
              //  Container(child: KompleksPage()),
              // ProductionPage(),
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
                                          fontSize:
                                              UiJ.sizeweight(context) ? 20 : 25,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
          )),
      drawer: DrowerPage(),
    );
  }

  selectionPage(int page) {
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
        return KompleksDetailesPage();
      case 6:
        return CatalogPage();
    }
  }
}
