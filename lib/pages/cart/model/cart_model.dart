
//Cart DB
class CartDB {
  static const String key = "KEY";
  static const String cartTable = "CartTable";
  static const String productName = "NAME";
  static const String id = "PRODUCT_ID";
  static const String price = "PRICE";
  static const String quantity = "QUANTITY";
  static const String image = "IMAGE";
}

class CartProduct {
  String id;
  String productName;
  String image;
  double price;
  int quantity;
  int? key;
  CartProduct({
     this.key,
    required this.id,
    required this.image,
    required this.productName,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      CartDB.key: key,
      CartDB.id: id,
      CartDB.productName: productName,
      CartDB.price: price,
      CartDB.quantity: quantity,
      CartDB.image: image,
    };
  }
}