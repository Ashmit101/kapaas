import 'package:flutter/material.dart';
import 'package:kapaas/database/db_helper.dart';
import 'package:kapaas/tiles/product_tile.dart';

import '../entities/products.dart';

DbHelper _dbHelper = DbHelper();

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Future<List<Map>> storedProductsData = _dbHelper.readProducts();

  final Widget circularProgress = const Center(
    child: CircularProgressIndicator(),
  );

  @override
  void initState() {
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: (() async {
                bool succeeded = await Navigator.pushNamed(context, '/products/form') as bool;

                if (succeeded) {
                  refreshProductData();
                }
              }),
              child: const Icon(Icons.add, size: 26,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.more_vert),
            )
          ),
        ],
      ),

      body: FutureBuilder(
        future: storedProductsData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<Map> products = snapshot.data as List<Map>;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index){
                  var product = Product.fromMap(products[index]);
                  return ProductTile(
                    id: product.id!,
                    name: product.name,
                    price: product.price);
                }
              );
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
        } ,
      ),
    );
  }

  void refreshProductData() {
    setState( () {
      storedProductsData = _dbHelper.readProducts();
    });
  }
}