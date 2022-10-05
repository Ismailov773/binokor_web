import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UiJ {
  static final companyName = 'ООО \"DSK Binokor\"';

  static final color = HexColor("#686868");

  static final font = 'Play';  //sans-serif

  static final fontbold = 'PlayBold';

  static final String url = 'http://localhost:8087/';

  static final String adress = '100083, Узбекистан, г.Ташкент, Бектемирский р-н, ул. Зироат 91';

  static final String phone = '+998 71 205 0853';

  static final String telegram = 't.me/dsk_binokor_uzb';
  static final String inhstagram =
      '';
  static final String facebook = '';




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
