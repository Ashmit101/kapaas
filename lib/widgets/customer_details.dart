import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapaas/database/tables.dart';
import 'package:provider/provider.dart';

class CustomerDetails extends StatefulWidget {
  final Customer customer;
  const CustomerDetails({Key? key, required this.customer}) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  var measurementStyle = const TextStyle(fontSize: 20, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<KapaasDatabase>(context);

    var measurementFuture = database.getMeasurement(widget.customer.id as int);
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.customer.name,
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              widget.customer.phone,
              style: const TextStyle(fontSize: 25),
            ),
            Card(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: measurementFuture,
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        var measurements = snapshot.data as List<Measurement>;
                        if (measurements.isNotEmpty) {
                          var measurement = measurements[0];
                          return Column(children: [
                            const Text(
                              'Measurements:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Neck: ${measurement.neck}',
                                style: measurementStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Waist: ${measurement.waist}',
                                style: measurementStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Hip: ${measurement.hip}',
                                style: measurementStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Wrist: ${measurement.wrist}',
                                style: measurementStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Arm: ${measurement.arm}',
                                style: measurementStyle,
                              ),
                            ),
                          ]);
                        } else {
                          return const Text('No measurement data available');
                        }
                      }
                    }
                    return const Text('Waiting for the data...');
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
