import 'package:agri_uber/model/order_list_model.dart';
import 'package:agri_uber/widget/hex_color.dart';
import 'package:agri_uber/widget/list_order_list.dart';
import 'package:agri_uber/widget/text_menu_top.dart';
import 'package:circle_bottombar/animation_circle_bottom_bar.dart';
import 'package:circle_bottombar/tab_item.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 48),
            TextMenuTop(),
            SizedBox(height: 20),

            ListOrderList(),
            SizedBox(height: 11),
            // TabViewBottom(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _cIndex,
          type: BottomNavigationBarType.shifting,
          // backgroundColor: Colors.white,
          // fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: HexColor('#859AA6')),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: HexColor('#859AA6')),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone, color: HexColor('#859AA6')),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.clear, color: HexColor('#859AA6')),
              title: Text(''),
            ),
          ],
          onTap: (index) {
            _incrementTab(index);
          },
        ),
      ),
    );
  }
}
