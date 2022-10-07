import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Image> _items = [
   Image.asset('assets/images/kompleks.png'),
    Image.asset('assets/images/production.png'),
    Image.asset('assets/images/production.png'),
    Image.asset('assets/images/production.png'),

  ];


  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 800,
        //   height: 800,
        child: Column(children: [
      CarouselSlider(
          items: _items.map((e) {
            return Builder(builder: (BuildContext context){
              return Container(child: e,);
            });
          }).toList(),
          options: CarouselOptions(
            height: 600,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (int? value, page) {},
            scrollDirection: Axis.horizontal,
          ))
    ]));
  }
}
