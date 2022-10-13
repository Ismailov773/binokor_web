import 'package:binokor_web/bloc/dsk_state.dart';
import 'package:binokor_web/bloc/job_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

import '../models/Job.dart';
import '../models/uij.dart';

List<Job> _listjob = [];

class JobPage extends StatelessWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobBloc, DskState>(
        builder: (context, state) {
          if (state is DskEmtyState) {
            return Center(child: Text("No data!"));
          }
          if (state is DskLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is JobLoadedState) {
            _listjob = state.loadedjods;
            _listjob.sort((a, b) => a.id!.compareTo(b.id!));
            return Container(
                padding: EdgeInsets.only(left: 100, right: 100),
                color: Colors.white,
                child: main(context));
          }
          if (state is DskErrorState) {
            return Center(
              child: Text("Сервер не работает!"),
            );
          }
          return SizedBox.shrink();
        },
        listener: (context, state) {});
  }

  Widget main(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Вакансии",
              style: TextStyle(
                  fontFamily: UiJ.fontbold,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SizedBox(
            height: 30,
          ),
          Expanded(
              child: Container(
                  // color: Colors.white,
                  child: VerticalTabs(
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
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height/9,
                                    child: Card(child: Container(
                                      alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Text(e.department!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: UiJ.fontbold))))))),
                          )
                          .toList(),
                      contents: _listjob.map((e) {
                        return Padding(
                            padding: EdgeInsets.all(20),
                            child: ListView.builder(
                              itemBuilder: (context, idx) {
                                return Container(
                                    child: e.joblist![idx].title! == true
                                        ? Text(
                                            e.joblist![idx].description!,
                                            style: TextStyle(
                                                fontFamily: UiJ.fontbold,
                                                fontSize: 20),
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
                                                text: e
                                                    .joblist![idx].description!,
                                                style: TextStyle(
                                                    fontFamily: UiJ.font,
                                                    fontSize: 20))
                                          ])));
                              },
                              itemExtent: 40,
                              itemCount: e.joblist!.length,
                            ));
                      }).toList()))),
        ]);
  }
}
