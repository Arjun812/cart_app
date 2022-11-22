import 'package:flutter/material.dart';

import '../pages/cart/view/cart.dart';
import '../pages/productPage/view/product_page.dart';


class Routes {

  static const String home = 'home';
  static const String cart = 'cart';


  Map<String, WidgetBuilder> routeBuilders(BuildContext context) {
    return {

      home: (context) => const ProductPage(),

      cart: (context) => const Cart(),

    };
  }
}