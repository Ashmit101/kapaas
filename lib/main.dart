import 'package:carousel_slider/carousel_slider.dart';
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
  final List<Widget> imageListItems = [
    // container for image1
    Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/coat.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    // container for image2
    Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/gown.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    // container for image3
    Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/lehenga.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    // container for image4
    Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/saree.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    // container for image5
    Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/suit.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    // container for image6
    Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/suit2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  ];

  //New scrollcontroller to remove scrollcontroller error

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Column(mainAxisSize: MainAxisSize.max,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView(
              shrinkWrap: true,
              controller: ScrollController(),
              children: [
                CarouselSlider(
                  items: imageListItems,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 2,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: MediaQuery.of(context).size.aspectRatio,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/orders/form');
              },
              icon: const Icon(Icons.add_shopping_cart_rounded),
              label: const Text('Place Order Now!'),
            )
          ]),
      drawerScrimColor: Color.fromARGB(200, 0, 0, 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.75, // 75% width
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
        Navigator.pushNamed(context, '/products');
        break;
      case Screens.payments:
        // TODO: Handle this case.
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
