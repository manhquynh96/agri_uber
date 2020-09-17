import 'package:agri_uber/widget/hex_color.dart';
import 'package:agri_uber/widget/ticket.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Agricultural extends StatefulWidget {
  @override
  _AgriculturalState createState() => _AgriculturalState();
}

class _AgriculturalState extends State<Agricultural> {
  bool status1 = false;
  bool status2 = false;
  List<String> _locations = ['A', 'B', 'C', 'D', 'E'];
  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      color: HexColor('#F8F8F9'),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //
            _buildDropdownButton(),
            //
            _buildTextFieldCargoVolumn(),
            //
            _buildTextPicture(),
            SizedBox(height: 18),
            //
            _buildPicture(),
            SizedBox(height: 22),
            //
            _buildTicket(),
            SizedBox(height: 24),
            //
            _buildCombinedDelivery(),
            SizedBox(height: 26),
            //
            _buildRefrigeration(),
            _buildTextReceiverPhone(),
            //
            _buildTextPhone(),
            _buildContainerPhone(),
            SizedBox(height: 30),
            _buildTextFieldNote(),
            _buildContainerNote(),
            _buildButtonSave(),
          ],
        ),
      ),
    );
  }

  _buildDropdownButton() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 23),
      // height: 1,
      child: DropdownButton(
        hint: Text(
          'Agricultural products',
          style: TextStyle(fontSize: 13, color: HexColor('#718794')),
        ),
        value: _selectedLocation,
        isExpanded: true,
        style: TextStyle(color: HexColor('#718794')),
        items: _locations.map((e) {
          return DropdownMenuItem(
            child: Text(e),
            value: e,
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _selectedLocation = newValue;
          });
        },
      ),
    );
  }

  _buildTextFieldCargoVolumn() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 23),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 9,
                child: TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Cargo volume',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintStyle:
                        TextStyle(fontSize: 13, color: HexColor('#718794')),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text('Kg',
                    style: TextStyle(fontSize: 13, color: HexColor('#EC93A3'))),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: HexColor('#C5D0D4')))),
          ),
        ],
      ),
    );
  }

  _buildTextPicture() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 20, top: 20),
      child: Text(
        'Picture of Order',
        style: TextStyle(fontSize: 13, color: HexColor('#718794')),
      ),
    );
  }

  _buildPicture() {
    return DottedBorder(
      strokeWidth: 1,
      borderType: BorderType.RRect,
      dashPattern: [6, 3],
      radius: Radius.circular(5),
      color: HexColor('#D0D0D0'),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: 200,
          height: 135,
          color: HexColor('#FFFFFF'),
        ),
      ),
    );
  }

  _buildTicket() {
    return Ticket(
      width: 284,
      punchRadius: 10,
      borderRadius: 3,
      top: Container(
        height: 129,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: _buildColumnNote(),
            ),
            Expanded(
              flex: 10,
              child: _buildFromTo(),
            ),
          ],
        ),
      ),
      bottom: Container(
        height: 92,
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.only(left: 15, top: 17, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              _buildTime(text: 'Collection time', date: '16/09/2020'),
              _buildTime(text: 'Delivery time', date: '15/09/2020'),
            ],
          ),
        ),
      ),
    );
  }

  _buildTime({String text, String date}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 12, color: HexColor('#8D9598')),
        ),
        SizedBox(height: 11),
        Row(
          children: [
            Text(
              date,
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
            Icon(
              Icons.date_range,
              color: HexColor('#EC93A3'),
              size: 15,
            )
          ],
        ),
        SizedBox(height: 11),
        Container(
          width: 120,
          height: 1,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1, color: HexColor('#C5D0D4'))),
          ),
        ),
      ],
    );
  }

  _buildColumnNote() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: 12,
              height: 12,
              margin: EdgeInsets.only(left: 10, top: 21),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: HexColor('#E0F1F4'),
              ),
            ),
            Container(
              width: 4,
              height: 4,
              margin: EdgeInsets.only(left: 14, top: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: HexColor('#65B6C8'),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 2),
          child: RotatedBox(
            quarterTurns: -1,
            child:
                Text(' _ _ _ _ _ _ ', style: TextStyle(color: Colors.black26)),
          ),
        ),
        Stack(
          children: [
            Container(
              width: 12,
              height: 12,
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: HexColor('#F8EBF6'),
              ),
            ),
            Container(
              width: 4,
              height: 4,
              margin: EdgeInsets.only(left: 14, top: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: HexColor('#E794D4'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildFromTo() {
    return Container(
      margin: const EdgeInsets.only(left: 11, top: 13, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'From',
            style: TextStyle(fontSize: 12, color: HexColor('#8D9598')),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vận chuyển từ:',
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
              Icon(
                Icons.place,
                color: HexColor('#EC93A3'),
                size: 17,
              ),
            ],
          ),
          SizedBox(height: 7),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: HexColor('#D3DCDF')))),
          ),
          SizedBox(height: 13),
          Text(
            'To',
            style: TextStyle(fontSize: 12, color: HexColor('#8D9598')),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vận chuyển đến:',
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
              Icon(
                Icons.place,
                color: HexColor('#EC93A3'),
                size: 17,
              ),
            ],
          ),
          SizedBox(height: 7),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: HexColor('#D3DCDF')))),
          ),
        ],
      ),
    );
  }

  _buildCombinedDelivery() {
    return Container(
      margin: EdgeInsets.only(left: 17, right: 19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Combined Delivery',
              style: TextStyle(fontSize: 13, color: HexColor('#8D9598'))),
          //Tạo nút trượt.(library: flutter_switch)
          FlutterSwitch(
            width: 51,
            height: 25,
            toggleSize: 23,
            value: status1,
            borderRadius: 15,
            padding: 2,
            activeColor: Colors.green,
            onToggle: (value) {
              setState(() {
                status1 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  _buildRefrigeration() {
    return Container(
      margin: EdgeInsets.only(left: 17, right: 19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Refrigeration',
              style: TextStyle(fontSize: 13, color: HexColor('#8D9598'))),
          //Tạo nút trượt.(library: flutter_switch)
          FlutterSwitch(
            width: 51,
            height: 25,
            toggleSize: 23,
            value: status2,
            borderRadius: 15,
            padding: 2,
            activeColor: Colors.green,
            onToggle: (value) {
              setState(() {
                status2 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  _buildTextReceiverPhone() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 16, top: 34),
      child: Text('Receiver Phone Number',
          style: TextStyle(fontSize: 13, color: HexColor('#718794'))),
    );
  }

  _buildTextPhone() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 16, top: 11),
      child: Text('Số điện thoại',
          style: TextStyle(fontSize: 13, color: Colors.black)),
    );
  }

  _buildContainerPhone() {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 7, right: 19),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: HexColor('#C5D0D4')))),
    );
  }

  _buildTextFieldNote() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 23),
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Note',
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintStyle: TextStyle(fontSize: 13, color: HexColor('#718794')),
        ),
      ),
    );
  }

  _buildContainerNote() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 19),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: HexColor('#C5D0D4')))),
    );
  }

  _buildButtonSave() {
    return Container(
      width: 120,
      height: 40,
      margin: const EdgeInsets.only(top: 44, bottom: 29),
      child: RaisedButton(
        color: HexColor('#6CAED3'),
        child:
            Text('SAVE', style: TextStyle(fontSize: 13, color: Colors.white)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {},
      ),
    );
  }
}
