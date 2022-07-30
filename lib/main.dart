import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kapaas/forms/customers_form.dart';
import 'package:kapaas/screens/customers.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kapaas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Kapaas'), // default home:
        '/customers': (context) => const CustomerScreen(),
        '/customers/form': (context) => const CustomersForm(),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      drawerScrimColor: Color.fromARGB(200, 0, 0, 0),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('lib/images/Kapaas.png'),
                  )),
              child: Center(child: Text(' ')),
            ),
            ListTile(
              title: const Text('Customers'),
              onTap: (() {
                // Go to customers page
                navigateTo(Screens.customers);
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
        break;
      case Screens.payments:
        // TODO: Handle this case.
        break;
      case Screens.employees:
        // TODO: Handle this case.
        break;
    }
  }
}
