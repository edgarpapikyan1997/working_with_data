import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:working_with_data_project/provider/binance_provider.dart';

import '../networking/web_sockets/coinCap_web_socket.dart';
import '../networking/web_sockets/web_socket.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({
    super.key,
  });

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  // final modelData = BinanceProvider();
  double? price;

  @override
  void initState() {
    final vm = context.read<BinanceProvider>();
    price = vm.model?.p != null ? double.parse(vm.model!.p as String) : 0.0;
    vm.getData();
    vm.addToList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BinanceProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'ETH/USDT price',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20)),
                    height: 400,
                    width: 300,
                    child: LineChart(
                      curve: Curves.linear,
                      duration: const Duration(seconds: 5),
                      LineChartData(

                        minX: 0,
                        maxX: 200,
                        minY: 0,
                        maxY: 5000,
                        lineBarsData: [
                          LineChartBarData(
                            spots: vm.spotList,
                          ),
                        ],

                        gridData: FlGridData(show: true),

                        borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: Colors.purple.shade500,
                              width: 2,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(vm.model?.p ?? '0',
                      style: TextStyle(
                        fontSize: 25,
                      )),
                ],
              ),
              // child: StreamBuilder(
              //   stream: coinCapChannel.stream,
              //   builder: (context, snapshot) {
              //     return Text(snapshot.hasData ? "${snapshot.data}" : '');
              //   },
              // ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
