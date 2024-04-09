import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:working_with_data_project/networking/web_sockets/coinCap_web_socket.dart';

import '../models/binance_model/binance_model.dart';

class BinanceProvider extends ChangeNotifier {
  final coinCapChannel = CoinCapSocket().coinCapChannel;
  BinanceModel? model;
  double counter = 0;

  List<FlSpot> spotList = [];

  void addToList() async{
    counter++;
    double price = model?.p != null ? double.parse(model?.p as String) : 0.0;
    spotList.add(
      FlSpot(counter, price),
    );
    // notifyListeners();
  }

  void getData() async {
    try {
      coinCapChannel.stream.listen((message) async {
        Map<String, dynamic> jsonMap = json.decode(message);
        model = BinanceModel.fromJson(jsonMap);
        addToList();
        print(model?.p);
        if(spotList.length == 50){
          closeChannel();
        }
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
  }

  void closeChannel(){
    coinCapChannel.sink.close();
  }
}
