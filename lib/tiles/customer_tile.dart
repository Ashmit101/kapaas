import 'package:flutter/material.dart';

class CustomerTile extends StatelessWidget {
  final int id;
  final String name;
  final String contact;

  const CustomerTile(
      {super.key, required this.name, required this.contact, required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(id.toString()),
        title: Text(name),
        subtitle: Text(contact),
      ),
    );
  }
}
