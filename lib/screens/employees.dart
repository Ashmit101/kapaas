import 'package:flutter/material.dart';
import 'package:kapaas/database/tables.dart';
import 'package:kapaas/tiles/employee_tile.dart';
import 'package:provider/provider.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final Widget circularProgress = const Center(
    child: CircularProgressIndicator(),
  );

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<KapaasDatabase>(context);
    var storedEmployeesData = database.allEmployeeEntries;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? succeeded =
              await Navigator.pushNamed(context, '/employees/form') as bool?;
          if (succeeded != null && succeeded) {
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: storedEmployeesData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //Future has completed
            if (snapshot.hasData) {
              List<Employee> employees = snapshot.data as List<Employee>;
              //Display the list of customers
              return ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  // var customer = Customer.fromMap(customers[index]);
                  var employee = employees[index];
                  return EmployeeTile(
                      id: employee.id!,
                      name: employee.name,
                      salary: employee.salary);
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('There was an error getting the stored data!'),
              );
            } else {
              return circularProgress;
            }
          } else {
            //Future is still loading
            return circularProgress;
          }
        },
      ),
    );
  }
}
