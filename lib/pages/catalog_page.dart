import 'dart:convert';

import 'package:binokor_web/pages/imagecatalog_page.dart';
import 'package:binokor_web/provider/simple_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository.dart';
import '../bloc/catalog_bloc.dart';
import '../bloc/dsk_state.dart';
import '../bloc/make_bloc.dart';
import '../models/Catalog.dart';
import '../models/Make.dart';
import '../models/uij.dart';

List<Catalog> _listCatalog = [];
List<Make> _listMake = [];

Repository repository = Repository();

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MakeBloc, DskState>(
        builder: (context, state) {
          if (state is DskEmtyState) {
            return Center(child: Text("No data!"));
          }
          if (state is DskLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is MakeLoadedState) {
            _listMake = state.loadedMake;
            _listMake.sort((a, b) => a.id!.compareTo(b.id!));

            return Container(
                padding: EdgeInsets.only(left: 100, right: 100), child: main());
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

  Widget main() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text("Каталоги",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Noto')),
        ),
        Divider(),
        SizedBox(
          height: 20,
        ),
        Expanded(child: mainPage()),
      ],
    );
  }

  Widget mainPage(){

    return Container();
  }

  // Widget mainPage() {
  //   return GridView.builder(
  //       itemCount: _listMake.length,
  //       gridDelegate:
  //           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
  //
  //       itemBuilder: (context, index) {
  //         // String? imagepath = _listImage
  //         //     .firstWhere((element) => element.catalog!.id ==  _list[index].id)
  //         //     .imagepath;
  //
  //         return Container(
  //             child: InkWell(
  //           onTap: () {
  //             context.read<SimpleProvider>().changeindexpage(3);
  //             // Navigator.push(
  //             //   context,
  //             //   MaterialPageRoute(builder: (context) => ImageCatalogPage(catalog: _list[index])),
  //             // );
  //           },
  //           child: Card(
  //             child: Column(
  //               children: [
  //                 Container(
  //                     padding: EdgeInsets.all(20),
  //                     alignment: Alignment.topLeft,
  //                     child: Text(
  //                       _listMake[index].name!,
  //                       style: TextStyle(
  //                           fontSize: 20,
  //                           fontWeight: FontWeight.w900,
  //                           fontFamily: 'Play'),
  //                     )),
  //                 Divider(),
  //                 Expanded(
  //                   child: Image.network(
  //                       '${UiJ.url}make/download/makes/${_listMake[index].imagepath}',
  //                       errorBuilder: (
  //                     BuildContext context,
  //                     Object error,
  //                     StackTrace? stackTrace,
  //                   ) {
  //                     return Center(
  //                       child: CircularProgressIndicator(),
  //                     );
  //                   }),
  //                 ),
  //                 Expanded(
  //                     child: Padding(
  //                         padding: EdgeInsets.all(20),
  //                         child: Text(
  //                           "    " + _listMake[index].description!,
  //                           textAlign: TextAlign.justify,
  //                           style: TextStyle(
  //                               fontSize: 10,
  //                               fontWeight: FontWeight.w900,
  //                               fontFamily: UiJ.font),
  //                         )))
  //               ],
  //             ),
  //           ),
  //         ));
  //       });
  // }
}
