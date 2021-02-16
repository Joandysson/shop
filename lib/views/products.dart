import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/views/app_drower.dart';
import 'package:shop/providers/products.dart' as ProductsProvider;
import 'package:shop/widgets/product_item.dart';

class Products extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<ProductsProvider.Products>(context, listen: false)
        .loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider.Products>(context);
    final products = productsData.items;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gerenciar produtos'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
              },
            )
          ],
        ),
        drawer: AppDrawer(),
        body: RefreshIndicator(
          onRefresh: () => _refreshProducts(context),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: productsData.itemsCount,
              itemBuilder: (ctx, i) => Column(
                children: [
                  ProductItem(products[i]),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
