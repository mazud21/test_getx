import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'infinityPassenger.dart';
import 'loadData.dart';

class Passenger extends StatefulWidget {
  final String id;
  final String namaKat;
  bool isSelected = false;
  String selectedChoice = "";

  Passenger({this.id, this.namaKat});

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Passenger> {

  bool cekFilter = false, opacity = false;
  String kategori = "", subkategori = "", cari = "", token = '', filter;

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  String _connectionStatus = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            '${widget.namaKat}',
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search_rounded),
              onPressed: () => null,
            ),
          ]),
      body: FutureBuilder(
          future: Provider.of<LoadData>(context, listen: false).getPassenger(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CupertinoActivityIndicator(
                animating: true,
                radius: 15,
              ); /*SizedBox();*/
            } else {
              debugPrint("CEK_FILTER:" + cekFilter.toString());
              return InfinityPassenger(
                passengerModel: snapshot.data,
              );
            }
          }),
    );
  }
}
