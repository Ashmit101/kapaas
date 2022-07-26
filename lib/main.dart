import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kapaas/database/tables.dart';
import 'package:kapaas/forms/customers_form.dart';
import 'package:kapaas/screens/customers.dart';
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
          '/about': (context) => const AboutScreen(),
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

      body: Column(children: [
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
            itemBuilder: (context, i, id) {
              return GestureDetector(
                  child: ClipRRect(
                child: Image.asset(
                  imageList[i],
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ));
            },
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {},
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
        // TODO: Handle this case.
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
