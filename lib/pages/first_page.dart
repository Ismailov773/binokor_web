import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/uij.dart';

List<Image> _items = [
  Image.asset('assets/images/kompleks.png'),
  Image.asset('assets/images/production.png'),
  Image.asset('assets/images/production.png'),
  Image.asset('assets/images/production.png'),
];
int _current = 0;
CarouselController carouselController = CarouselController();

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
          child: Column(
        children: [
          Center(
              child: CarouselSlider(
                  items: _items.map((e) {
                    return Builder(builder: (BuildContext context) {
                      return Container(child: e);
                    });
                  }).toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height /
                        (UiJ.sizeweight(context) ? 1.4 : 1.3),

                    aspectRatio: 16/9,
                    viewportFraction: 0.5,
                    initialPage: _current,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 5000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (int? value, page) {
                      setState(() {
                        _current = value!;
                        // print("${_current}");
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _items.map(
              (image) {
                int index = _items.indexOf(image);
                return InkWell(
                    onTap: () {
                      setState(() {
                        _current = index;
                        carouselController.jumpToPage(index);
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 10,
                      margin: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: _current == index ? Colors.red : Colors.black,
                          width: 1,
                        ),
                        color: _current == index ? Colors.red : Colors.white,
                      ),
                    ));
              },
            ).toList(), // this was the part the I had to add
          ),
        ],
      ));
    });
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
