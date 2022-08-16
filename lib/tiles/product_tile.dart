import 'package:kapaas/database/json/constants.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products(
      {Key? key, required this.title, required this.img, this.ordering = false})
      : super(key: key);
  final String title;
  final String img;
  final bool ordering;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int id = 0;
  List<Map<String, String>>? subCategory;

  void selectSubCategory() {
    print('Inside tile, ordering success: ${widget.ordering}');
    switch (widget.title) {
      case 'Lehenga':
        subCategory = catLehenga;
        id = 100;
        break;

      case 'Kurtha':
        subCategory = catKurtha;
        id = 200;
        break;

      case 'Saree':
        subCategory = catSaree;
        id = 300;
        break;

      case 'Blouse':
        subCategory = catBlouse;
        id = 400;
        break;

      case 'Gowns':
        subCategory = catGown;
        id = 500;
        break;

      case 'One Piece':
        subCategory = catOnePiece;
        id = 600;
        break;

      case 'Chaubandi':
        subCategory = catChaubandi;
        id = 700;
        break;

      case 'Daura Surwar':
        subCategory = catDauraSurwar;
        id = 800;
        break;

      case 'Jens Kurtha':
        subCategory = catJensKurtha;
        id = 900;
        break;

      case 'Suit':
        subCategory = catSuit;
        id = 1000;
        break;

      case 'Shirt Pant':
        subCategory = catShirtPant;
        id = 1100;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    selectSubCategory();
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  height: size.height * 0.45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.img), fit: BoxFit.cover)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.more_vert_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 170,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 82, 80, 80),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: subCategory?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (widget.ordering) {
                        var productId = id + index + 1;
                        Navigator.pop(context, productId);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              subCategory?[index]['imgUrl'] as String),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 115),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(100, 0, 0, 0),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              subCategory?[index]['title'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            Text(
                              subCategory?[index]['price'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ]));
  }
}

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
          Image.asset(imageSource,
              width: MediaQuery.of(context).size.width, height: 250),
          Text(
            "NR. ${price.toString()}",
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
