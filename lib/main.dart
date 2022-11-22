import 'package:flutter/material.dart';
import 'package:trial/pages/productPage/view/product_page.dart';
import 'package:trial/services/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DemoApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ProductPage(),
      routes: Routes().routeBuilders(context),
    );
  }
}
