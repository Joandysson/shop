import 'package:flutter/material.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/views/auth_or_home.dart';
import 'package:shop/views/cart.dart';
import 'package:shop/views/oders.dart';
import 'package:shop/views/product_detail.dart';
import 'package:shop/views/product_form.dart';
import 'package:shop/views/products.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.AUTH_OR_HOME: (ctx) => AuthOrHome(),
  AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetail(),
  AppRoutes.CART: (ctx) => Cart(),
  AppRoutes.ORDERS: (ctx) => Orders(),
  AppRoutes.PRODUCTS: (ctx) => Products(),
  AppRoutes.PRODUCT_FORM: (ctx) => ProductForm(),
};
