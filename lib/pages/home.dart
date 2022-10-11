import 'package:binokor_web/pages/imagenews_page.dart';
import 'package:binokor_web/pages/production_page.dart';
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
          iconTheme: IconThemeData(color: Colors.black, size: 40),
          flexibleSpace: Padding(
            padding: EdgeInsets.only(left: 100),
            child: Row(children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    context.read<SimpleProvider>().changeindexpage(1);
                    context.read<SimpleProvider>().changeindextab(0);
                    return Home();
                  }));
                },
                child: Container(
                  child: Image.asset('assets/images/logo1.png'),
                  width: 200,
                  height: 150,
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width /
                    (UiJ.sizeweight(context) ? 5 : 7),
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
                    catalogBloc.add(DskLoadEvent());
                    context.read<SimpleProvider>().changeindexpage(1);
                    context.read<SimpleProvider>().changeindextab(1);
                  } else if (idx == 0) {
                    context.read<SimpleProvider>().changeindexpage(1);
                    context.read<SimpleProvider>().changeindextab(0);
                  } else {
                    context.read<SimpleProvider>().changeindexpage(1);
                    context.read<SimpleProvider>().changeindextab(idx);
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
          actions: [],
          titleTextStyle: TextStyle(fontWeight: FontWeight.w200, fontSize: 45),
        ),
      ),
      body: ListView(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              child:
                  selectionPage(context.watch<SimpleProvider>().getindexpage)),
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
                                  fontSize: UiJ.sizeweight(context) ? 25 : 30,
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
                      child: Row(
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
                            )
                          ])),
                )
              ],
            ),
          ),
        ],
      ),
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
            CatalogPage(),
            KompleksPage(),
            ProductionPage(),
            ContactPage(),
          ],
        );
      case 2:
        return MenegersPage();
      case 3:
        return NewsPage();
      // case 4:
      //   return ImageNewsPage(news: news);
    }
  }
}
