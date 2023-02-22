import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

import '../getconrollers/Controller.dart';
import '../models/Job.dart';
import '../models/uij.dart';

List<Job> _listjob = [];

class JobPage extends StatelessWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.find();
    return Obx(() {
      _listjob = controller.listJob;
      return main(context);
    });
  }

  Widget main(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width > UiJ.widthSize
                      ? 100
                      : 20,
                  right: MediaQuery.of(context).size.width > UiJ.widthSize
                      ? 100
                      : 20),
              child: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.topLeft,
                child: Text(
                  "Вакансии",
                  style: TextStyle(
                      fontFamily: UiJ.fontbold,
                      fontSize:
                          MediaQuery.of(context).size.width > UiJ.widthSize
                              ? 30
                              : 15,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Divider(),
          SizedBox(
            height: 30,
          ),
          MediaQuery.of(context).size.width > UiJ.widthSize
              ? tabWeb(context)
              : tabPhone(context)
        ]);
  }

  Widget tabWeb(context) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.only(left: 100, right: 100),
            child: _listjob == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : VerticalTabs(
                    contentScrollAxis: Axis.vertical,
                    backgroundColor: Colors.white,
                    tabBackgroundColor: Colors.white,
                    indicatorColor: Colors.white,
                    // tabsShadowColor: Colors.white,
                    tabsWidth: MediaQuery.of(context).size.width / 3,
                    tabsElevation: 5,
                    tabs: _listjob
                        .map(
                          (e) => Tab(
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                  child: Card(
                                      child: Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blue.shade800)),
                                          alignment: Alignment.centerLeft,
                                          child: Text(e.department!,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily:
                                                      UiJ.fontbold)))))),
                        )
                        .toList(),
                    contents: _listjob.map((e) {
                      return Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Align(
                                child: Text(
                                  e.vacancy!,
                                  style: TextStyle(
                                      fontFamily: UiJ.fontbold,
                                      color: Colors.indigoAccent,
                                      fontSize: 25),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                              Divider(),
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                  child: ListView.builder(
                                itemBuilder: (context, idx) {
                                  return Container(
                                      margin: EdgeInsets.all(10),
                                      child: e.joblist![idx].title! == true
                                          ? Text(
                                              e.joblist![idx].description!,
                                              style: TextStyle(
                                                  fontFamily: UiJ.fontbold,
                                                  fontSize: 20,
                                                  color: Colors.indigoAccent),
                                            )
                                          : RichText(
                                              text: TextSpan(children: [
                                              WidgetSpan(
                                                  child: Icon(
                                                Icons.circle,
                                                size: 15,
                                              )),
                                              WidgetSpan(
                                                  child: SizedBox(
                                                width: 20,
                                              )),
                                              TextSpan(
                                                  text: e.joblist![idx]
                                                      .description!,
                                                  style: TextStyle(
                                                    fontFamily: UiJ.font,
                                                    fontSize: 20,
                                                  ))
                                            ])));
                                },

                                // itemExtent: 100,
                                itemCount: e.joblist!.length,
                              ))
                            ],
                          ));
                    }).toList())));
  }

  Widget tabPhone(context) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: _listjob == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : VerticalTabs(
                    contentScrollAxis: Axis.vertical,
                    backgroundColor: Colors.white,
                    tabBackgroundColor: Colors.white,
                    indicatorColor: Colors.white,
                    // tabsShadowColor: Colors.white,
                    tabsWidth: MediaQuery.of(context).size.width / 3,
                    tabsElevation: 5,
                    tabs: _listjob
                        .map(
                          (e) => Tab(
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                  child: Card(
                                      child: Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blue.shade800)),
                                          alignment: Alignment.centerLeft,
                                          child: Text(e.department!,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontFamily:
                                                      UiJ.fontbold)))))),
                        )
                        .toList(),
                    contents: _listjob.map((e) {
                      return Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Align(
                                child: Text(
                                  e.vacancy!,
                                  style: TextStyle(
                                      fontFamily: UiJ.fontbold,
                                      color: Colors.indigoAccent,
                                      fontSize: 10),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                              Divider(),
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                  child: ListView.builder(
                                itemBuilder: (context, idx) {
                                  return Container(
                                      margin: EdgeInsets.all(10),
                                      child: e.joblist![idx].title! == true
                                          ? Text(
                                              e.joblist![idx].description!,
                                              style: TextStyle(
                                                  fontFamily: UiJ.fontbold,
                                                  fontSize: 10,
                                                  color: Colors.indigoAccent),
                                            )
                                          : RichText(
                                              text: TextSpan(children: [
                                              WidgetSpan(
                                                  child: Icon(
                                                Icons.circle,
                                                size: 10,
                                              )),
                                              WidgetSpan(
                                                  child: SizedBox(
                                                width: 10,
                                              )),
                                              TextSpan(
                                                  text: e.joblist![idx]
                                                      .description!,
                                                  style: TextStyle(
                                                    fontFamily: UiJ.font,
                                                    fontSize: 10,
                                                  ))
                                            ])));
                                },

                                // itemExtent: 100,
                                itemCount: e.joblist!.length,
                              ))
                            ],
                          ));
                    }).toList())));
  }
}
