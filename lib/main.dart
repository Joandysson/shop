import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart' as CartProvider;
import 'package:shop/providers/orders.dart' as OrderProvider;
import 'package:shop/providers/products.dart' as ProductsProvider;
import 'package:shop/providers/auth.dart' as AuthProvider;
import 'package:shop/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider.Auth()),
        ChangeNotifierProxyProvider<AuthProvider.Auth,
            ProductsProvider.Products>(
          update: (ctx, auth, previousProducts) =>
              ProductsProvider.Products(auth.token, previousProducts.items),
          create: (_) => ProductsProvider.Products(null, []),
        ),
        ChangeNotifierProvider(create: (_) => CartProvider.Cart()),
        ChangeNotifierProxyProvider<AuthProvider.Auth, OrderProvider.Orders>(
            create: (_) => OrderProvider.Orders(null, []),
            update: (ctx, auth, previousOrders) =>
                OrderProvider.Orders(auth.token, previousOrders.items)),
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
