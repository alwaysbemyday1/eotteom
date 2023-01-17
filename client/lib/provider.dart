import 'dart:math';
import 'package:flutter/material.dart';

class SignInPage extends ChangeNotifier {
  var page = 0;

  pageUp() {
    page++;
    notifyListeners();
  }

  pageDown() {
    page--;
    notifyListeners();
  }
}

class Position extends ChangeNotifier {
  var topX = 0.0, topY = 0.0;
  var bottomX = 0.0, bottomY = 0.0;
  var shoesX = 0.0, shoesY = 0.0;
  var accessoryX = 0.0, accessoryY = 0.0;

  getRand(phoneWidth) {
    topX =
        (Random().nextInt((((phoneWidth - 24) - 8) * 0.05).toInt())).toDouble();
    topY = (Random().nextInt((((phoneWidth - 24) - 8) * 0.2858).toInt()))
        .toDouble();
    bottomX = (Random().nextInt((((phoneWidth - 24) - 8) * 0.1333).toInt()))
        .toDouble();
    bottomY =
        (Random().nextInt((((phoneWidth - 24) - 8) * 0.25).toInt())).toDouble();
    shoesX = (Random().nextInt((((phoneWidth - 24) - 8) * 0.1333).toInt()))
        .toDouble();
    shoesY =
        (Random().nextInt((((phoneWidth - 24) - 8) * 0.05).toInt())).toDouble();
    accessoryX = (Random().nextInt((((phoneWidth - 24) - 8) * 0.1333).toInt()))
        .toDouble();
    accessoryY =
        (Random().nextInt((((phoneWidth - 24) - 8) * 0.05).toInt())).toDouble();

    notifyListeners();
  }
}
