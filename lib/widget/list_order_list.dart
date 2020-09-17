import 'package:agri_uber/model/order_list_model.dart';
import 'package:agri_uber/widget/hex_color.dart';
import 'package:agri_uber/widget/ticket.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class ListOrderList extends StatefulWidget {
  @override
  _ListOrderListState createState() => _ListOrderListState();
}

class _ListOrderListState extends State<ListOrderList> {
  List<OrderListModel> list = [];

  @override
  void initState() {
    super.initState();

    getOrderList();
  }

  //get all documents name of a collection
  void getOrderList() {
    final orderRef = Firestore.instance.collection("order_list");

    orderRef.getDocuments().then((snapshot) {
      snapshot.documents.forEach((doc) {
        print(doc.data);
      });
    });

    orderRef.getDocuments().then((value) {
      list =
          value.documents.map((e) => OrderListModel.fromJson(e.data)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 633,
      child: ListView.builder(
        itemCount: list.length ?? 0,
        itemBuilder: (context, index) {
          return Center(
            child: Ticket(
              top: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${list[index].masp}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(41, 104, 139, 1),
                      ),
                    ),
                    Text(
                      '${list[index].datetime}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(68, 121, 151, 1),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('#EAF8FA'),
                      ),
                      child: Text(
                        '${list[index].form}',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color.fromRGBO(76, 176, 183, 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              bottom: Container(
                height: 100,
                child: Row(
                  children: [
                    //
                    _buildContainerNote(),
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.only(top: 5, right: 20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                isDense: true,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                labelText: '${list[index].place_from}',
                                labelStyle: TextStyle(
                                    fontSize: 14, color: HexColor('#6E7071')),
                                contentPadding: EdgeInsets.all(0.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.only(top: 5, right: 20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                isDense: true,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                labelText: '${list[index].place_to}',
                                labelStyle: TextStyle(
                                    fontSize: 14, color: HexColor('#6E7071')),
                                contentPadding: EdgeInsets.all(0.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              width: 385,
              borderRadius: 5,
              punchRadius: 10,
            ),
          );
        },
      ),
    );
  }

  _buildContainerNote() {
    return Expanded(
      flex: 1,
      child: Column(
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
              child: Text(' _ _ _ ', style: TextStyle(color: Colors.black26)),
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
      ),
    );
  }
}
