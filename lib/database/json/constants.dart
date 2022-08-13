import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String homeImg = 'assets/images/products/ProductPage.webp';

const List<Map<String, String>> categories = [
  {
    'title': 'Lehenga',
    'imgUrl': 'assets/images/products/lehenga_party_wear.jpg',
  },
  {
    'title': 'Kurtha',
    'imgUrl': 'assets/images/products/kurtha_churidar.jpg',
  },
  {
    'title': 'Saree',
    'imgUrl': 'assets/images/products/saree_normal.jpg',
  },
  {
    'title': 'Blouse',
    'imgUrl': 'assets/images/products/blouse_normal.jpg',
  },
  {
    'title': 'Gowns',
    'imgUrl': 'assets/images/products/gown_heavy.jpg',
  },
  {
    'title': 'One Piece',
    'imgUrl': 'assets/images/products/onepiece_short.jpg',
  },
  {
    'title': 'Chaubandi',
    'imgUrl': 'assets/images/products/lehenga.jpeg',
  },
  {
    'title': 'Daura Surwar',
    'imgUrl': 'assets/images/products/daurasurwar_normal.jpg',
  },
  {
    'title': 'Jens Kurtha',
    'imgUrl': 'assets/images/products/jenskurtha_normal.jpg',
  },
  {
    'title': 'Suit',
    'imgUrl': 'assets/images/products/suit.jpg',
  },
  {
    'title': 'Shirt Pant',
    'imgUrl': 'assets/images/products/shirtpant_normal.jpg',
  },
];

const List<Map<String, String>> catLehenga = [
  {
    'title': 'Panel Lehenga',
    'imgUrl': 'assets/images/products/lehenga_panel.jpg',
    'price' : 'Rs. 8,000',
  },
  {
    'title': 'Circular Lehenga',
    'imgUrl': 'assets/images/products/lehenga_circular.jpg',
    'price' : 'Rs. 8,000',
  },
  {
    'title': 'Mermaid Lehenga',
    'imgUrl': 'assets/images/products/lehenga_mermaid.jpeg',
    'price' : 'Rs. 8,000',
  },
  {
    'title': 'Party Wear',
    'imgUrl': 'assets/images/products/lehenga_party_wear.jpg',
    'price' : 'Rs. 8,000',
  },
  {
    'title': 'Bridal Lehenga',
    'imgUrl': 'assets/images/products/lehenga_bridal.jpg',
    'price' : 'Rs. 8,000',
  },
];

const List<Map<String, String>> catKurtha = [
  {
    'title': 'Straight Kurtha',
    'imgUrl': 'assets/images/products/kurtha_straight.jpg',
    'price' : 'Rs. 2,000',
  },
  {
    'title': 'Umbrella Kurtha',
    'imgUrl': 'assets/images/products/kurtha_umbrella.jpg',
    'price' : 'Rs. 2,000',
  },
  {
    'title': 'Normal Kurtha',
    'imgUrl': 'assets/images/products/kurtha_normal.jpg',
    'price' : 'Rs. 2,000',
  },
  {
    'title': 'Anarkali',
    'imgUrl': 'assets/images/products/kurtha_anarkali.jpg',
    'price' : 'Rs. 2,000',
  },
  {
    'title': 'Churidar',
    'imgUrl': 'assets/images/products/kurtha_churidar.jpg',
    'price' : 'Rs. 2,000',
  },
];

const List<Map<String, String>> catSaree = [
  {
    'title': 'Normal Saree',
    'imgUrl': 'assets/images/products/saree_normal.jpg',
    'price' : 'Rs. 3,000',
  },
  {
    'title': 'Fixed Saree',
    'imgUrl': 'assets/images/products/saree_fixed.jpg',
    'price' : 'Rs. 3,000',
  },
  {
    'title': 'Lehenga Saree',
    'imgUrl': 'assets/images/products/saree_lehenga.jpg',
    'price' : 'Rs. 3,000',
  },
  {
    'title': 'Banarasi Saree',
    'imgUrl': 'assets/images/products/saree_banarasi.jpg',
    'price' : 'Rs. 3,000',
  },
];

const List<Map<String, String>> catBlouse = [
  {
    'title': 'Normal',
    'imgUrl': 'assets/images/products/blouse_normal.jpg',
    'price' : 'Rs. 2,000',
  }
];

const List<Map<String, String>> catGown = [
  {
    'title': 'Heavy Gown',
    'imgUrl': 'assets/images/products/gown_heavy.jpg',
    'price' : 'Rs. 12,000',
  },
  {
    'title': 'Normal Gown',
    'imgUrl': 'assets/images/products/gown_normal.jpg',
    'price' : 'Rs. 12,000',
  }
];

const List<Map<String, String>> catOnePiece = [
  {
    'title': 'Long',
    'imgUrl': 'assets/images/products/onepiece_long.jpg',
    'price' : 'Rs. 1,800',
  },
  {
    'title': 'Short',
    'imgUrl': 'assets/images/products/onepiece_short.jpg',
    'price' : 'Rs. 1,800',
  }
];

const List<Map<String, String>> catChaubandi = [
  {
    'title': 'Normal Chaubandi',
    'imgUrl': 'assets/images/products/saree.jpeg',
    'price' : 'Rs. 2,500',
  },
  {
    'title': 'Chadani Chaubandi',
    'imgUrl': 'assets/images/products/saree.jpeg',
    'price' : 'Rs. 2,500',
  },
];

const List<Map<String, String>> catDauraSurwar = [
  {
    'title': 'Normal',
    'imgUrl': 'assets/images/products/daurasurwar_normal.jpg',
    'price' : 'Rs. 2,500',
  },
];

const List<Map<String, String>> catJensKurtha = [
  {
    'title': 'Normal',
    'imgUrl': 'assets/images/products/jenskurtha_normal.jpg',
    'price' : 'Rs. 3,000',
  }
];

const List<Map<String, String>> catSuit = [
  {
    'title': 'Normal',
    'imgUrl': 'assets/images/products/suit.jpg',
    'price' : 'Rs. 15,000',
  }
];

const List<Map<String, String>> catShirtPant = [
  {
    'title': 'Normal',
    'imgUrl': 'assets/images/products/shirtpant_normal.jpg',
    'price' : 'Rs. 9,000',
  }
];

List itemsTab = [
  {"icon": Icons.home, "size": 28.0},
  {"icon": FontAwesomeIcons.mapMarkerAlt, "size": 22.0},
  {"icon": FontAwesomeIcons.userAlt, "size": 21.0},
  {"icon": FontAwesomeIcons.shoppingBag, "size": 22.0},
  {"icon": Icons.more_horiz, "size": 30.0},
];