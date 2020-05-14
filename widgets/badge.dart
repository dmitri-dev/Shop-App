import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key key,
    @required this.child,
    @required this.value,
    this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 6,
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                style: BorderStyle.solid,
              ),
              color: color != null ? color : Theme.of(context).primaryColor,
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 10,
              maxHeight: 25,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body2.copyWith(
                    color: Colors.black,
                    fontSize: 15,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
