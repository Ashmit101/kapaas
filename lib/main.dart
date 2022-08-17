import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kapaas/database/tables.dart';
import 'package:kapaas/forms/customers_form.dart';
import 'package:kapaas/forms/employees_form.dart';
import 'package:kapaas/forms/measurements_form.dart';
import 'package:kapaas/forms/order_form.dart';
import 'package:kapaas/screens/customers.dart';
import 'screens/screens.dart';

import 'screens/products.dart';
import 'screens/payment.dart';
import 'screens/employees.dart';
import 'screens/about.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => KapaasDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kapaas',
        theme: ThemeData.light(),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(title: 'Kapaas'), // default home:
          '/customers': (context) => const CustomerScreen(),
          '/customers/form': (context) => const CustomersForm(),

          '/products': (context) => const ProductScreen(),

          '/payment': (context) => const Payments(),

          '/employees': (context) => const EmployeeScreen(),
          '/employees/form': (context) => const EmployeesForm(),

          '/about': (context) => const AboutScreen(),

          '/orders/form': (context) => const OrderForm(),

          '/customers/measurements/form': (context) => const MeasurementsForm(
                customerId: 0,
              ),
        },
      ),
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var drawerWidth = size.width > 800 ? size.width * 0.25 : size.width * 0.75;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Container(
        alignment: Alignment.topLeft,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/flower.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child : SingleChildScrollView(
            child: Column(
            children: [
            Container(
              height: 0.1*MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: (32 * size.height * 0.0016 ).toDouble(),
                ),
              ),
              width: size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(100, 0, 0, 0),
              ),
              padding: const EdgeInsets.all(10),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/orders/form');
              },
              icon: const Icon(Icons.add_shopping_cart_rounded),
              label: const Text('Place Order Now!'),
            )
          ]),
        ),
      ),
      drawerScrimColor:const Color.fromARGB(100, 0, 0, 0),
      drawer: Drawer(
        width: drawerWidth, 
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.blue,
              height: 35,
            ),
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('lib/images/Kapaas.png'),
                  )),
              child: Center(child: Text(' ')),
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
                navigateTo(Screens.payments);
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
                // Go to About page
                navigateTo(Screens.about);
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
        Navigator.pushNamed(context, '/products',arguments: false);
        break;
      case Screens.payments:
        // TODO: Handle this case.
        Navigator.pushNamed(context, '/payment');
        break;
      case Screens.employees:
        Navigator.pushNamed(context, '/employees');
        break;
      case Screens.about:
        Navigator.pushNamed(context, '/about');
        break;
    }
  }
}
