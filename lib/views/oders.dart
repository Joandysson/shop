import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/views/app_drower.dart';
import 'package:shop/providers/orders.dart' as OrdersProvider;
import 'package:shop/widgets/order.dart' as OrdersWidget;

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrdersProvider.Orders orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, i) => OrdersWidget.Order(
          orders.items[i],
        ),
      ),
    );
  }
}
