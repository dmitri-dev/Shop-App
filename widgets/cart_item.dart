import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;
  final String image;

  CartItem(
    this.id,
    this.productId,
    this.title,
    this.price,
    this.quantity,
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 15,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (dismiss) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to remove the item from the cart?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 15,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: Container(
              width: 100,
              child: FittedBox(
                child: Image.network(image),
                fit: BoxFit.scaleDown,
              ),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.body1,
            ),
            subtitle: Text(
              'Total: \$${price * quantity}',
              style: Theme.of(context).textTheme.body1.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
