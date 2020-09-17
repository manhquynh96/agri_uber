import 'package:agri_uber/order_list/order_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.green,
      home: OrderList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
