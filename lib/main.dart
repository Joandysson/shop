import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart' as CartProvider;
import 'package:shop/providers/orders.dart' as OrderProvider;
import 'package:shop/views/oders.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/views/product_detail.dart';
import 'package:shop/views/products_overview.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/views/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => CartProvider.Cart()),
        ChangeNotifierProvider(create: (_) => OrderProvider.Orders()),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        // home: ProductOverView(),
        routes: {
          AppRoutes.HOME: (ctx) => ProductOverView(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetail(),
          AppRoutes.CART: (ctx) => Cart(),
          AppRoutes.ORDERS: (ctx) => Orders(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
