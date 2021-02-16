import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart' as CartProvider;
import 'package:shop/providers/orders.dart' as OrderProvider;
import 'package:shop/providers/products.dart' as ProductsProvider;
import 'package:shop/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider.Products()),
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
        routes: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
