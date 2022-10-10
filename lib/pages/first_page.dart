import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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

  int _current = 0;

  // final List<Color> kMixedColors = [
  //   Color(0xff71A5D7),
  //   Color(0xff72CCD4),
  //   Color(0xffFBAB57),
  //   Color(0xffF8B993),
  //   Color(0xff962D17),
  //   Color(0xffc657fb),
  //   Color(0xfffb8457),
  // ];

  // GlobalKey<CarouselSliderState> _sliderKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 800,
        //   height: 800,
        child: Column(
      children: [
        // Container(
        //     alignment: Alignment.centerLeft,
        //     child: IconButton(
        //       icon: Icon(
        //         Icons.navigate_before,
        //         size: 50,
        //       ),
        //       color: Colors.black,
        //       onPressed: () {
        //         setState(() {
        //           _current++;
        //         });
        //       },
        //     )),
        CarouselSlider(
            items: _items.map((e) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  child: Card(
                    elevation: 5,
                    child: e,
                  ),
                );
              });
            }).toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height/1.3,
              aspectRatio: 16 / 9,
              viewportFraction: 0.5,
              initialPage: _current,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 5000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (int? value, page) {
                setState(() {
                  _current = value!;
                  print("${_current}");
                });
              },
              scrollDirection: Axis.horizontal,
            )),
        // Container(
        //     alignment: Alignment.centerRight,
        //     child: IconButton(
        //       icon: Icon(
        //         Icons.navigate_next,
        //         size: 50,
        //       ),
        //       color: Colors.black26,
        //       onPressed: () {},
        //     )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _items.map(
            (image) {
              int index = _items.indexOf(image);
              return Container(
                width: 40,
                height: 10,
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: _current == index ? Colors.red : Colors.black,
                    width: 1,
                  ),
                  color: _current == index ? Colors.red : Colors.white,
                ),
              );
            },
          ).toList(), // this was the part the I had to add
        ),
      ],
    ));
  }
}

// CarouselSlider.builder(
// // key: _sliderKey,
// itemCount: _items.length,
// slideTransform: CubeTransform(),
// slideIndicator: CircularSlideIndicator(
// padding: EdgeInsets.only(bottom: 32),
// ),
// unlimitedMode: true,
// enableAutoSlider: true,
// autoSliderDelay: Duration(seconds: 2),
// autoSliderTransitionCurve: Curves.fastOutSlowIn,
// autoSliderTransitionTime: Duration(milliseconds: 1000),
//
// slideBuilder: (int index) {
// return Container(
// child: Card(
// elevation: 5,
// child: _items[index],
// ),
// );
// },
// ),
