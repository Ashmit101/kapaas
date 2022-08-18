import 'dart:ui';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:kapaas/database/tables.dart';
import 'package:kapaas/forms/customers_form.dart';
import 'package:kapaas/forms/employees_form.dart';
import 'package:kapaas/forms/measurements_form.dart';
import 'package:kapaas/forms/order_form.dart';
import 'package:kapaas/screens/customers.dart';
import 'package:kapaas/screens/orders.dart';
import 'screens/screens.dart';

import 'screens/products.dart';
import 'screens/payment.dart';
import 'screens/orders.dart';
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

          '/orders': (context) => const OrderScreen(),
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

    var scale_factor = size.width / 800;
    //smallscreen
    var drawerWidth = size.width * 0.75;
    var crossCount = 1;
    var rfontSize = 36;
    var logoSize = 40;
    //largeScreen
    if (size.width > 800) {
      drawerWidth = size.width * 0.25;
      crossCount = 2;
      rfontSize = 40;
      logoSize = 60;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 238, 238),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
              height: size.height * 0.35,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 67, 152, 213),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(38 * scale_factor),
                      bottomRight: Radius.circular(38 * scale_factor)))),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kaapas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: rfontSize.toDouble(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(44 * scale_factor),
                      child: Image.asset(
                        'assets/logo.png',
                        width: logoSize.toDouble(),
                        height: logoSize.toDouble(),
                      ),
                    ),
                  ]),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.3,
                  crossAxisCount: crossCount,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/customers.svg',
                            height: 200,
                          ),
                          const Text(
                            '254 Customers',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/orders.svg',
                                height: 200,
                              ),
                              Text(
                                '1000+ Orders',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ])),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/products.svg',
                                height: 200,
                              ),
                              Text(
                                '20+ Products',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ])),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/categories.svg',
                                height: 200,
                              ),
                              Text(
                                '500+ Designs',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ]))
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
      drawerScrimColor: const Color.fromARGB(100, 0, 0, 0),
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
                navigateTo(Screens.orders);
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
        Navigator.pushNamed(context, '/orders');
        break;
      case Screens.products:
        Navigator.pushNamed(context, '/products', arguments: false);
        break;
      case Screens.payments:
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
