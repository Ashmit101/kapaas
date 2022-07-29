class Employee {
  int id;
  double salary;
  List<int> orderIds = [];

  Employee(this.id, this.salary);

  void addOrder(int orderId) {
    orderIds.add(orderId);
  }
}
