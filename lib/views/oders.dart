import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/views/app_drower.dart';
import 'package:shop/providers/orders.dart' as OrdersProvider;
import 'package:shop/widgets/order.dart' as OrdersWidget;

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<OrdersProvider.Orders>(context, listen: false)
        .loadOrders()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final OrdersProvider.Orders orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: orders.itemsCount,
              itemBuilder: (ctx, i) => OrdersWidget.Order(
                orders.items[i],
              ),
            ),
    );
  }
}
