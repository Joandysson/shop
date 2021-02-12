import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart' as ProviderCart;
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
        ChangeNotifierProvider(create: (_) => ProviderCart.Cart()),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverView(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetail(),
          AppRoutes.CART: (ctx) => Cart(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
