import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kapaas/forms/customers_form.dart';
import 'package:kapaas/screens/customers.dart';
import 'screens/screens.dart';

import 'screens/products.dart';
import 'package:kapaas/forms/products_form.dart';
import 'screens/employees.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kapaas',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Kapaas'),
        '/customers': (context) => const CustomerScreen(),
        '/customers/form': (context) => const CustomersForm(),
        
        '/products':(context) => const ProductScreen(),
        '/products/form': (context) => const ProductsForm(),

        '/employees': (context) => const EmployeeScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<String> imageList = [
    'assets/images/marina-abrosimova-S-T0FPEnGZM-unsplash.jpg',
    'assets/images/ayrton-bR4BzKRZSDo-unsplash.jpg',
    'assets/images/freysteinn-g-jonsson-X4wXfbhUe_4-unsplash.jpg',
    'assets/images/dmitry-dreyer-Qx1PqHChW80-unsplash.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: Column(
        children: [
          Container(
            alignment:FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height:10),
                Image.asset('assets/logo.png', width:80, height:80),
                const SizedBox(height:10),
                const Text("Kapaas",style: TextStyle(fontSize:28)),
                const Text("A BOUTIQUE DATABASE MANAGEMENT SYSYEM", style: TextStyle(fontSize:6),),
                const SizedBox(height:10),
              ],
            )
          ),
          Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: CarouselSlider.builder(
            itemCount: imageList.length,
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              viewportFraction: 1,
              reverse: false,
              aspectRatio: 2,
            ),
            itemBuilder: (context, i, id){
              return GestureDetector(
                  child: ClipRRect(
                    child:Image.asset(
                        imageList[i],
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                    ),
                  )
              );
            },
          ),
        ),
        const SizedBox(height:20),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add_shopping_cart_rounded), 
          label: const Text('Place Order Now!'),
        )
        ]
      ),


      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.75, // 75% width
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height:150,
              child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(90, 29, 185, 196),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/logo.png', width:50, height:50,),
                      const SizedBox(width:20), //Spacing
                      const Text("Kapaas", style: TextStyle(fontSize: 28),),
                    ],
                  ),
                ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Customers', style: TextStyle(fontSize: 16)),
              onTap: (() {
                // Go to customers page
                navigateTo(Screens.customers);
              }),
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart_rounded),
              title: const Text('Orders', style: TextStyle(fontSize: 16)),
              onTap: (() {
                // Go to customers page
              }),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag_rounded),
              title: const Text('Products', style: TextStyle(fontSize: 16)),
              onTap: (() {
                // Go to customers page
                navigateTo(Screens.products);
              }),
            ),
            ListTile(
              leading: const Icon(Icons.attach_money_rounded),
              title: const Text('Payments', style: TextStyle(fontSize: 16)),
              onTap: (() {
                // Go to customers page
              }),
            ),
            ListTile(
              leading: const Icon(Icons.business_center_rounded),
              title: const Text('Employees', style: TextStyle(fontSize: 16)),
              onTap: (() {
                // Go to Employee page
                navigateTo(Screens.employees);
              }),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text('About', style: TextStyle(fontSize: 16)),
              onTap: (() {
                // Go to Employee page
              }),
            )
          ],
        ),
      ),
    );
  }

  void navigateTo(Screens screen) {
    switch (screen) {
      case Screens.customers:
        Navigator.pushNamed(context, '/customers');
        break;
      case Screens.orders:
        // TODO: Handle this case.
        break;
      case Screens.products:
        // TODO: Handle this case.
        Navigator.pushNamed(context, '/products');
        break;
      case Screens.payments:
        // TODO: Handle this case.
        break;
      case Screens.employees:
        // TODO: Handle this case.
        Navigator.pushNamed(context, '/employees');
        break;
      case Screens.about:
        // TODO: Handle this case.
        break;
    }
  }
}
