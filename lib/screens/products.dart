import 'package:flutter/material.dart';
import 'package:kapaas/database/tables.dart';
import 'package:kapaas/tiles/product_tile.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductScreenState();
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
    final database = Provider.of<KapaasDatabase>(context);
    var storedProductsData = database.allProductsEntries;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: (() async {
                bool succeeded =
                    await Navigator.pushNamed(context, '/products/form')
                        as bool;

                if (succeeded) {
                  // refreshProductData();
                }
              }),
              child: const Icon(
                Icons.add,
                size: 26,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_vert),
              )),
        ],
      ),
      body: FutureBuilder(
        future: storedProductsData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<Product> products = snapshot.data as List<Product>;
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    var product = products[index];
                    return ProductTile(
                        id: product.id!,
                        name: product.name,
                        price: product.price);
                  });
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('No product available right now.'),
              );
            } else {
              return circularProgress;
            }
          } else {
            //Future is still loading
            return circularProgress;
          }
        },
      ),
    );
  }
}
