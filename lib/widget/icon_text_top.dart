import 'package:flutter/material.dart';

class IconTextTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(205, 216, 223, 0.25),
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.clear, color: Color.fromRGBO(55, 146, 197, 1)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        Text(
          'Create Order',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(41, 104, 139, 1.0),
          ),
        ),
        Container(
          width: 48,
          height: 48,
          margin: const EdgeInsets.only(right: 18),
        ),
      ],
    );
  }
}
