import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/views/app_drower.dart';
import 'package:shop/providers/orders.dart' as OrdersProvider;
import 'package:shop/widgets/order.dart' as OrdersWidget;

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meus pedidos'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future: Provider.of<OrdersProvider.Orders>(
            context,
            listen: false,
          ).loadOrders(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.error != null) {
              return Center(child: Text('Error inesperado'));
            }

            return Consumer<OrdersProvider.Orders>(
              builder: (ctx, orders, child) {
                return ListView.builder(
                  itemCount: orders.itemsCount,
                  itemBuilder: (ctx, i) => OrdersWidget.Order(
                    orders.items[i],
                  ),
                );
              },
            );
          },
        ));

    //   _isLoading
    //       ? Center(
    //           child: CircularProgressIndicator(),
    //         )
    //       : ListView.builder(
    //           itemCount: orders.itemsCount,
    //           itemBuilder: (ctx, i) => OrdersWidget.Order(
    //             orders.items[i],
    //           ),
    //         ),
    // );
  }
}
