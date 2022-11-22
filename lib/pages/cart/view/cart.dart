import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/pages/cart/viewModel/cart_cubit.dart';
import 'package:trial/services/data_base.dart';
import 'package:trial/widget/app_bar.dart';
import 'package:trial/widget/cart_card.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ShopAppBar(
        title: "Cart",
      ),
      body: BlocProvider(
        create: (context) =>
        CartCubit()
          ..getCart(),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if(state is CartLoading){
              return CircularProgressIndicator();
            }
            if(state is CartLoaded){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount:state.cartData?.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartCard(
                          onDecrement: (decrement){
                              update(
                                key:
                                state.cartData![index].key,
                                quantity: state.cartData![index].quantity + decrement,
                              );
                              BlocProvider.of<CartCubit>(context).getCart();                          },
                          onIncrement: (increment){
                            update(
                              key:
                              state.cartData![index].key,
                              quantity: state.cartData![index].quantity + increment,
                            );
                            BlocProvider.of<CartCubit>(context).getCart();
                          },
                          count: state.cartData![index].quantity,
                          price: state.cartData![index].price.toInt(),
                          image: state.cartData![index].image,
                          name: state.cartData![index].productName,
                          key: UniqueKey(),
                          onRemove: (){
                            deleteProduct(state.cartData![index].key!);
                            BlocProvider.of<CartCubit>(context).getCart();
                          },
                        ),
                      )
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
