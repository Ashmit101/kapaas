import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/tables.dart';

class EmployeeTile extends StatelessWidget {
  final int id;
  final String name;
  final double salary;

  const EmployeeTile(
      {super.key, required this.name, required this.salary, required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(id.toString()),
        title: Text(name),
        subtitle: Text(salary.toString()),
        trailing: PopupMenuButton<DatabaseOptions>(
          itemBuilder: (context) => <PopupMenuEntry<DatabaseOptions>>[
            const PopupMenuItem(
              value: DatabaseOptions.delete,
              child: Text('Delete'),
            ),
            const PopupMenuItem(
              value: DatabaseOptions.edit,
              child: Text('Update'),
            )
          ],
          onSelected: (value) {
            final employee = Employee(name: name, salary: salary, id: id);
            final database =
                Provider.of<KapaasDatabase>(context, listen: false);
            switch (value) {
              case DatabaseOptions.delete:
                database.deleteEmployee(employee);
                refreshEmployeesList(context);
                break;
              case DatabaseOptions.edit:
                updateEmployee(context, employee);
                break;
              default:
            }
          },
        ),
      ),
    );
  }

  void updateEmployee(BuildContext context, Employee employee) async {
    bool? succeeded = await Navigator.pushNamed(context, '/employees/form',
        arguments: employee) as bool?;
    if (succeeded != null && succeeded) {
      refreshEmployeesList(context);
    }
  }

  void refreshEmployeesList(BuildContext context) {
    Navigator.popAndPushNamed(context, '/employees');
  }
}
