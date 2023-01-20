import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UiJ {
  static final companyName = 'ООО \"DSK Binokor\"';

  static final color = HexColor("#686868");
  static final hovercolor = Colors.yellow[50];

  static final font = 'Play'; //sans-serif
  static final fontbold = 'PlayBold';
  //static final String url = "https://dsk-webapp.azurewebsites.net/";

  static final String url = 'https://api.dsk.uz:8089/';
  //static final String url = 'http://localhost:8089/';
  static final String adress =
      'г.Ташкент, Янгихаётский район, ул.Зироат, дом 4, 100083, Узбекистан';
  static final String phone = '+998 71 205 0853';
  static final String telegram = 't.me/dsk_binokor_uzb';
  static final String inhstagram = '';
  static final String facebook = '';
  static final String lozung =
      'ЛИДЕР ПО ВЫСОКОТЕХНОЛОГИЧНОМУ ПРОИЗВОДСТВУ ЖЕЛЕЗОБЕТОННЫХ ИЗДЕЛИЙ ПО УЗБЕКИСТАНУ';

  static final double widthSize = 600;

  static final header_azur_image = {'Content-Type': 'application/octet-stream'};

// static final String prod_description = '    На сегодняшний день, компания \"DSK Binokor\" является одним из ведущих стройподрядчиков Узбекистана и производит различные массивные железобетонные изделия для сборного строительства, с использованием новейшего немецкого оборудования.';

  static callTelegram() async {
    String url = "https://${UiJ.telegram}";
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not url';
    }
  }

  static callInstagram() async {
    String url = "https://${UiJ.inhstagram}";
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not url';
    }
  }

  static callFacebook() async {
    String url = "https://${UiJ.facebook}";
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not url';
    }
  }

  static callrefer(String path) async {
    String url = "https://${path}";
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not url';
    }
  }

  static bool sizeweight(BuildContext context) {
    if (kIsWeb) {
      return true;
    } else {
      return false;
    }
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
