import 'package:flutter/material.dart';
import 'package:kapaas/database/tables.dart';
import 'package:provider/provider.dart';

class MeasurementsForm extends StatefulWidget {
  final int customerId;

  const MeasurementsForm({Key? key, required this.customerId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MeasurementsFormState();
}

class _MeasurementsFormState extends State<MeasurementsForm> {
  late int id;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController neckController = TextEditingController();
  final TextEditingController waistController = TextEditingController();
  final TextEditingController armController = TextEditingController();
  final TextEditingController hipController = TextEditingController();
  final TextEditingController wristController = TextEditingController();

  @override
  void initState() {
    super.initState();
    id = widget.customerId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Measurements'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Neck'),
                ),
                controller: neckController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the neck length';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Waist'),
                ),
                controller: waistController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the waist length';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Arm'),
                ),
                controller: armController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the arm length';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Hip'),
                ),
                controller: hipController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the hip length';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Wrist'),
                ),
                controller: wristController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the wrist length';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: (() {
                      if (_formKey.currentState!.validate()) {
                        // Inputs are valied
                        var neck = neckController.text as double;
                        var waist = waistController.text as double;
                        var arm = armController.text as double;
                        var hip = hipController.text as double;
                        var wrist = wristController.text as double;

                        final database = Provider.of<KapaasDatabase>(context);

                        final measurement = Measurement(
                            customerId: id,
                            neck: neck,
                            waist: waist,
                            arm: arm,
                            hip: hip,
                            wrist: wrist);
                        database.insertMeasurement(measurement);
                        goBackToCustomersList();
                      }
                    }),
                    child: const Text('Save')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goBackToCustomersList() {
    Navigator.pop(context, true);
  }
}
