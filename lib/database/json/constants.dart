import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String homeImg = 'assets/images/products/ProductPage.webp';

const List<Map<String, String>> categories = [
  {
    'title': 'New In',
    'imgUrl': 'assets/images/products/newIn.jpeg',
  },
  {
    'title': 'Lehengas',
    'imgUrl': 'assets/images/products/lehenga.jpeg',
  },
  {
    'title': 'Sarees',
    'imgUrl': 'assets/images/products/sari.webp',
  },
  {
    'title': 'Kurta Sets',
    'imgUrl': 'assets/images/products/kurtaSet.webp',
  },
  {
    'title': 'Gowns',
    'imgUrl': 'assets/images/products/lehenga.jpeg',
  },
];

List itemsTab = [
  {"icon": Icons.home, "size": 28.0},
  {"icon": FontAwesomeIcons.mapMarkerAlt, "size": 22.0},
  {"icon": FontAwesomeIcons.userAlt, "size": 21.0},
  {"icon": FontAwesomeIcons.shoppingBag, "size": 22.0},
  {"icon": Icons.more_horiz, "size": 30.0},
];
