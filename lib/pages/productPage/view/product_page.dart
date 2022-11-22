import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/pages/cart/model/cart_model.dart';
import 'package:trial/pages/cart/viewModel/cart_cubit.dart';
import 'package:trial/pages/productPage/model/product_model.dart';
import 'package:trial/services/data_base.dart';
import 'package:trial/utils/constants/constants.dart';
import 'package:trial/widget/app_bar.dart';
import 'package:trial/widget/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        appBar: ShopAppBar(
          title: 'Product',
          actions: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('cart');
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add_shopping_cart_rounded),
            ),
          ),
        ),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {

            return SingleChildScrollView(
              child: Column(children: [
                GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 4,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                      mainAxisExtent: 200,
                      crossAxisCount: 2,
                    ),
                    shrinkWrap: true,
                    itemCount: productModel!.length,
                    primary: false,
                    itemBuilder: (context, index) =>
                        ProductCard(
                          cartAdd: () {
                            CartProductDb().insertProduct(
                                CartProduct(
                                    id: productModel![index].id.toString(),
                                    image: productModel![index].image.toString(),
                                    productName: productModel![index].name.toString(),
                                    price: int.tryParse(productModel![index].price!)!.toDouble(),
                                    quantity: productModel![index].quantity??1)
                            );
                          },
                          padding: const EdgeInsets.all(8.0),
                          title: productModel![index].name,
                          image: productModel![index].image,
                          price: productModel![index].price,
                        )

                ),
              ],),
            );
          },
        ),
      ),
    );
  }
}
