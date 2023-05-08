import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class BarChartWidget extends StatefulWidget {
  @override
  _BarChartWidgetState createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  late Timer timer;

  List<double> _data = [0.1, 0.75, 0.3];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      _functionToBeExecuted();
    });
  }

  @override
  void dispose() {
    //別忘了在組件銷毀時取消計時器
    timer.cancel();
    super.dispose();
  }

  void _functionToBeExecuted() {
    //在這裡撰寫您要觸發的function內容
    _randomizeData();
  }

  void _randomizeData() {
    final random = Random();

    setState(() {
      _data = [
        random.nextDouble(),
        random.nextDouble(),
        random.nextDouble(),
      ];
    });
  }

  Widget _buildBarItem(double value) {
    double maxHeight = (value * 20) < 20 ? (value * 20) : 20;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: maxHeight,
      width: 4,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBarItem(_data[0]),
              SizedBox(width: 2),
              _buildBarItem(_data[1]),
              SizedBox(
                width: 2,
              ),
              _buildBarItem(_data[2]),
              // _data.map((value) => _buildBarItem(value)).toList()
            ],
          ),
        ),
        // ElevatedButton(
        //   onPressed: _randomizeData,
        //   child: Text('Randomize data'),
        // ),
      ],
    );
  }
}
