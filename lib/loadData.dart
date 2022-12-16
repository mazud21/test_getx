import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'modelPassenger.dart';

class LoadData extends ChangeNotifier {

  Future<PassengerModel> getPassenger() async {

    var url = "https://api.instantwebtools.net/v1/passenger?page=0&size=10";

    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {

        var result = PassengerModel.fromJson(json.decode(response.body));
        var result2 = json.decode(response.body)['data'][0]['airline'][0]['logo'];

        print('CHECK_RESULT1: $result');
        print('CHECK_RESULT2: $result2');

        return result;
      } else {
        debugPrint('statusSEARCH_cek_URL: ');
      }
    } on http.ClientException {
      print("throwing new error");
      throw Exception("Error on server");
    }
  }

}
