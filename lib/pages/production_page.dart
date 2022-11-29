import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/uij.dart';

class ProductionPage extends StatelessWidget {
  const ProductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width > UiJ.widthSize ? 100 : 20,
            right:
                MediaQuery.of(context).size.width > UiJ.widthSize ? 100 : 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("Производство",
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width > UiJ.widthSize
                              ? 30
                              : 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: UiJ.fontbold)),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                '    На сегодняшний день, компания \"DSK Binokor\" является одним из ведущих стройподрядчиков Узбекистана и производит различные массивные железобетонные изделия для сборного строительства, с использованием новейшего немецкого оборудования.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: UiJ.sizeweight(context) ? 20 : 25,
                    fontFamily: UiJ.font),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/production.png',
                      width: 400,
                      height: 400,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text("Производственная система",
                            style: TextStyle(
                                fontSize: UiJ.sizeweight(context) ? 20 : 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: UiJ.fontbold)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          '        Непрерывно инвестируя и расширяя производственные линии, мы обладаем высоким конкурентным преимуществом благодаря широкому ассортименту продукции, качеству и новейшим технологиям в производстве плит перекрытий и трехслойных панельных стен, которые являются основными элементами сборного строительства.     \n         Мы располагаем собственной транспортной системой на территории завода, а также подъездными железнодорожными путями. На заводе регулярно проводятся работы по модернизации и улучшению условий труда.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 20 : 25,
                              fontFamily: UiJ.font),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text("Современные тенденции строительства",
                            style: TextStyle(
                                fontSize: UiJ.sizeweight(context) ? 20 : 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: UiJ.fontbold)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Text(
                        '        Сегодняшняя архитектура строительства из сборных элементов позволяет существенно сократить сроки возведения объектов, благодаря предварительному заводскому изготовлению.\n        Производимые нами стеновые панели и перекрытия значительно повышают качество строительства. В особенности, обладая:',
                        style: TextStyle(
                            fontSize: UiJ.sizeweight(context) ? 20 : 25,
                            fontFamily: UiJ.font),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            TextSpan(children: [
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
                                  text:
                                      'улучшенными теплотехническими свойствами;')
                            ])
                          ],
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 20 : 25,
                              fontFamily: UiJ.font),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.circle,
                                size: 15,
                              )),
                              WidgetSpan(
                                  child: SizedBox(
                                width: 20,
                              )),
                              TextSpan(text: 'огнеупорностью;')
                            ])
                          ],
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 20 : 25,
                              fontFamily: UiJ.font),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            TextSpan(children: [
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
                                  text:
                                      'устойчивостью к атмосферным воздействиям;')
                            ])
                          ],
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 20 : 25,
                              fontFamily: UiJ.font),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            TextSpan(children: [
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
                                  text:
                                      'повышенной сейсмостойкостью (до 9.2 балла);')
                            ])
                          ],
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 20 : 25,
                              fontFamily: UiJ.font),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/technology.png',
                      width: 400,
                      height: 400,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text("Технологичность",
                            style: TextStyle(
                                fontSize: UiJ.sizeweight(context) ? 20 : 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: UiJ.fontbold)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          '        Производственный процесс на заводе "DSK Binokor" подразумевает строгое следование новейшим технологиям изготовления железобетонных изделий.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 20, fontFamily: UiJ.font),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text("Контроль качества",
                            style: TextStyle(
                                fontSize: UiJ.sizeweight(context) ? 20 : 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: UiJ.fontbold)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          '        Чтобы избежать возможного брака при поставке на объект (трещин или сколов), все изделия проходят обязательный контроль качества при поступлении на склад и перед отправкой заказчику. Наша компания производит (.....) типовые изделия, соответствующие ГОСТу (.....)',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: UiJ.sizeweight(context) ? 20 : 25,
                              fontFamily: UiJ.font),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ));
  }
}
