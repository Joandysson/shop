import 'package:flutter/material.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/views/auth.dart';
import 'package:shop/views/cart.dart';
import 'package:shop/views/oders.dart';
import 'package:shop/views/product_detail.dart';
import 'package:shop/views/product_form.dart';
import 'package:shop/views/products.dart';
import 'package:shop/views/products_overview.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.AUTH: (ctx) => Auth(),
  AppRoutes.HOME: (ctx) => ProductOverView(),
  AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetail(),
  AppRoutes.CART: (ctx) => Cart(),
  AppRoutes.ORDERS: (ctx) => Orders(),
  AppRoutes.PRODUCTS: (ctx) => Products(),
  AppRoutes.PRODUCT_FORM: (ctx) => ProductForm(),
};
