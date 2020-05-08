import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '\$${order.amount}',
              style: Theme.of(context).textTheme.body1,
            ),
            subtitle: Text(
              DateFormat('M/dd/yy hh:mm').format(order.dateTime),
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
