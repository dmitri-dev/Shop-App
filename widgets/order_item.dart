import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '\$${widget.order.amount}',
              style: Theme.of(context).textTheme.body1,
            ),
            subtitle: Text(
              DateFormat('M/dd/yy hh:mm').format(widget.order.dateTime),
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 15,
              ),
              height: min(
                widget.order.products.length * 20.0 + 20,
                200,
              ),
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            prod.title,
                            style: Theme.of(context).textTheme.body2,
                          ),
                          Text(
                            '${prod.quantity}x \$${prod.price}',
                            style: Theme.of(context).textTheme.body2,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
