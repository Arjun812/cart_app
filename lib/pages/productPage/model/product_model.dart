import 'package:trial/utils/constants/constants.dart';

class ProductModel{
  final int? id;
  final String? name;
  final String? image;
  final String? price;
  final int? quantity;

  ProductModel(this.id, {this.quantity, this.name, this.image, this.price});
}


 List<ProductModel>? productModel = [
ProductModel(
  1,
name: "Product1",
image: Base.networkImage,
  price: "20"
),

  ProductModel(
    2,
      name: "Product2",
      image: Base.networkImage,
      price: "10"
  ),
  ProductModel(
    3,
      name: "Product3",
      image: Base.networkImage,
      price: "60"
  ),
  ProductModel(
    4,
      name: "Product4",
      image: Base.networkImage,
      price: "120"
  ),
  ProductModel(
    5,
      name: "Product5",
      image: Base.networkImage,
      price: "30"
  ),
];