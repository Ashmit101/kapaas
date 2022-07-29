class Customer {
  int? id;
  String name;
  String contact;

  Customer(this.name, this.contact);

  void setID(int id) {
    this.id = id;
  }

  Customer.fromMap(Map<dynamic, dynamic> mapOfCustomer)
      : name = mapOfCustomer['name'],
        contact = mapOfCustomer['phone'] {
    id = mapOfCustomer['id'] as int;
  }
}
