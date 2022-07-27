import 'package:flutter/material.dart';

class CustomerTile extends StatelessWidget {
  final id;
  final name;
  final contact;

  const CustomerTile(
      {super.key, required this.name, required this.contact, this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(id),
        title: Text(name),
        subtitle: Text(contact),
      ),
    );
  }
}
