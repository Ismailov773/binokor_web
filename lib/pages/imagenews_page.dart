import 'package:binokor_web/models/ImageNews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/News.dart';
import '../models/uij.dart';

class ImageNewsPage extends StatelessWidget {
  final News news;

  const ImageNewsPage({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: news.imagenews!.length,
        itemBuilder: (context, idx) {
          return Container(
            child: Card(
                child: Image.network(
                    '${UiJ.url}news/download/imagenews/${news.imagenews![idx].imagepath}')),
          );
        });
  }
}
