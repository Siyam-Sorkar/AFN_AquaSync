import 'package:afn_hydro_link/Utilities/data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundDial extends StatelessWidget {
  final double heightWidth;
  final data;
  final String symbol;
  final dialName;
  final bool onTop;
  // final Color givColor;

  RoundDial({
    required this.heightWidth,
    required this.data,
    required this.symbol,
    required this.dialName,
    required this.onTop
    // required this.givColor
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(
        builder: (context, value, child) => Column(
          children: [
            onTop ? Text(dialName) : Container(),
            SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: heightWidth,
                  width: heightWidth,
                  // color: Colors.green[900],
                  child: CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    value: data/100,
                    strokeWidth: 15,
                    backgroundColor: Colors.green[100],
                    valueColor: AlwaysStoppedAnimation<Color>(data/100 <= 0.2 ? Colors.red : data/100 <= 0.5 ? Colors.orange : Colors.green.shade900),
                  ),
                ),
                Text(
                  // '${value.moistureLevel/100*100}%',
                  "$data$symbol",
                  style: TextStyle(fontSize: heightWidth/3.5, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10,),
            onTop ? Container() : Text(dialName)
          ],
        )
    );
  }
}
