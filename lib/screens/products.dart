// ignore_for_file: use_build_context_synchronously

import 'package:kapaas/database/json/constants.dart';
import 'package:flutter/material.dart';
import 'package:kapaas/tiles/product_tile.dart' as product_tile;

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final Widget circularProgress = const Center(
    child: CircularProgressIndicator(),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool? ordering = ModalRoute.of(context)!.settings.arguments as bool?;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Products'),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_vert),
              )),
        ],
      ),
      body: getBody(ordering),
    );
  }

  Widget getBody(bool? ordering) {
    var size = MediaQuery.of(context).size;
    return ListView(
      controller: ScrollController(),
      shrinkWrap: false,
      physics: ScrollPhysics(),
      children: [
        Stack(
          children: [
            Container(
              width: size.width,
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(homeImg), fit: BoxFit.cover)),
            ),
            Positioned(
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "New Collections",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: const [
                        Text(
                          "DISCOVER",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 18)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("All", style: TextStyle(color: Colors.grey[600])),
                  Icon(Icons.arrow_forward_ios,
                      color: Colors.grey[600], size: 18)
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(categories.length, (index) {
              return GestureDetector(
                onTap: () async {
                  if (ordering ?? false) {
                    int productId = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => product_tile.Products(
                            title: categories[index]['title'] as String,
                            img: categories[index]['imgUrl'] as String,
                            ordering: true,
                          ),
                        )) as int;
                    Navigator.pop(context, productId);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => product_tile.Products(
                                title: categories[index]['title'] as String,
                                img: categories[index]['imgUrl'] as String)));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: 195,
                    height: 220,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      categories[index]['imgUrl'] as String),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Positioned(
                          bottom: 5,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              categories[index]['title'] as String,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
