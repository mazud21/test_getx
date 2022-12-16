import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_getx/passenger.dart';

import 'modelPassenger.dart';

class InfinityPassenger extends StatefulWidget {
  PassengerModel passengerModel;

  InfinityPassenger({this.passengerModel});

  @override
  _InfinityPassengerState createState() => _InfinityPassengerState();
}

class _InfinityPassengerState extends State<InfinityPassenger> {
  List<Data> list = [];
  List<Airline> list1 = [];

  @override
  void initState() {
    super.initState();
    list = widget.passengerModel.data.cast<Data>();
    list1 = widget.passengerModel.data.cast<Airline>();
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) {
        return InkWell(
            onTap: () => null,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
                child: Stack(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.network('${list[i].airline[0].logo}', height: 50,),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('${list[i].name}'),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(/*list1[i].name*/''),
                                    ),
                                    margin: EdgeInsets.only(bottom: 8),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('Rp. ${list[i].trips}'),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 8, 8),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('Rp. ${list[i].airline[0].country}'),
                                    //child: Text('Rp. ${list1[i].name}'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
