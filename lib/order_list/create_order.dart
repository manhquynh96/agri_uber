import 'package:agri_uber/widget/agricultural.dart';
import 'package:agri_uber/widget/icon_text_top.dart';
import 'package:agri_uber/widget/text_menu_top.dart';
import 'package:flutter/material.dart';

class CreateOrder extends StatefulWidget {
  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 48),
            IconTextTop(),
            SizedBox(height: 39),
            Agricultural(),
          ],
        ),
      ),
    );
  }
}
