class Product {
  int? id;
  String name;
  int price;

  Product(this.name, this.price);

  void setID(int id){
    this.id = id;
  }

  Product.fromMap(Map<dynamic, dynamic> 
  mapOfProduct)
    :name = mapOfProduct['name'],
     price = mapOfProduct['price'] {
      id = mapOfProduct['id'] as int;
    }
}