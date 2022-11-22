import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../services/data_base.dart';
import '../model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  getCart()async{
    emit(CartLoading());
    try{
      List<CartProduct> cartProduct = await getProduct();
      emit(CartLoaded(cartProduct));
    }catch(e){
      emit(CartError(e.toString()));
    }
  }

  addToCart(int? id){

  }
}
