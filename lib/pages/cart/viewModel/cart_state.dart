part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
final  List<CartProduct>? cartData;

  CartLoaded(this.cartData);
}

class CartError extends CartState {
  final String? error;

  CartError(this.error);
}
