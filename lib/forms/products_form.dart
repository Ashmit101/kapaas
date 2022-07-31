import 'package:flutter/material.dart';
import 'package:kapaas/database/db_helper.dart';
import 'package:kapaas/entities/products.dart';

DbHelper _dbHelper = DbHelper();

class ProductsForm extends StatefulWidget {
  const ProductsForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Product Details'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Product name',
                label: Text('Name'),
              ),
              controller: nameController,
              keyboardType: TextInputType.name,
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a product name.';
                }
                return null;
              }),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.attach_money_rounded),
                hintText: 'Product\'s price',
                label: Text('Price'),
              ),
              controller: priceController,
              keyboardType: TextInputType.number,
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a price for the product';
                }
                return null;
              }),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      //Info correct
                      var name = nameController.text;
                      var price = priceController.text;
                      
                      Product products = Product(name, int.parse(price));
                      int id = await _dbHelper.saveProduct(products);

                      print("Product saved with ID: $id");

                      goBackToListPage(context);
                    }
                  },
                  child: const Text('Save'),
                  ),
            ),
          ],
        ),
      )
    );
  }
}

void goBackToListPage(BuildContext context) {
  Navigator.pop(context, true);
}