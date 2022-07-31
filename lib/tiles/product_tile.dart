import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final int id;
  final int price;
  final String name;
  final String imageSource = "assets/images/products/default.png";

  const ProductTile(
    {super.key, required this.name, required this.price, required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      // child: ListTile(
      //   leading: Image.asset(imageSource, width: 75, height: 75),
      //   title: Text(name),
      //   subtitle: Text(price.toString()),
      // ),
      child: ListBody(
          children: [
            const SizedBox(height: 20),
            Text(
              name, 
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(imageSource, width: MediaQuery.of(context).size.width, height: 250),
            Text(
              "NR. ${price.toString()}", 
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height:20),
          ],
      ),
    );
  }
}