import 'package:flutter/material.dart';
import 'package:shop/providers/orders.dart' as OrderProvider;
import 'package:intl/intl.dart';

class Order extends StatefulWidget {
  final OrderProvider.Order order;
  Order(this.order);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool _expended = false;

  @override
  Widget build(BuildContext context) {
    final itemsHeight = (widget.order.products.length * 25.0) + 10;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: _expended ? itemsHeight + 92 : 92,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
              subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date),
              ),
              trailing: IconButton(
                icon: Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expended = !_expended;
                  });
                },
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _expended ? itemsHeight : 0,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              child: ListView(
                children: widget.order.products.map(
                  (product) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${product.quantity}x R\$ ${product.price}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
