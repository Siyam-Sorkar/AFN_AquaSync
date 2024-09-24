import 'package:afn_hydro_link/Utilities/animated_refresh_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Utilities/data_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.green[50],
            elevation: 0,
            leading: IconButton(icon: Icon(Icons.menu), color: Colors.black, onPressed: () {  },),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Soil moisture level card
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Soil moisture level',
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text('Sunday, September 25, 2024'),
                                  SizedBox(height: 20),
                                ],
                              ),
                              // Transform.flip(flipX: true, child: Transform.rotate(angle: 180,
                              //     child: IconButton(onPressed: (){
                              //
                              //       setState(() {
                              //         if (value.moistureLevel/100 < 1) {
                              //           value.moistureLevel/100 += 0.1;
                              //         }
                              //         else{
                              //           value.moistureLevel/100 -= 0.2;
                              //         }
                              //       });},
                              //     icon: Icon(Icons.refresh_sharp, size: 50,)))),

                              AnimatedRefreshIcon(),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16.0),
                                    height: 200,
                                    width: 200,
                                    child: CircularProgressIndicator(
                                      strokeCap: StrokeCap.round,
                                      value: value.moistureLevel/100,
                                      strokeWidth: 25,
                                      backgroundColor: Colors.green[100],
                                      valueColor: AlwaysStoppedAnimation<Color>(value.moistureLevel/100 <= 0.15 ? Colors.red : value.moistureLevel/100 <= 0.3 ? Colors.orange : Colors.green.shade900),
                                    ),
                                  ),
                                  Text(
                                    // '${value.moistureLevel/100*100}%',
                                    "${value.moistureLevel.toString()}%",
                                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildIndicator('Optimal', Colors.green.shade900),
                                  SizedBox(height: 10,),
                                  _buildIndicator('Warning', Colors.orange),
                                  SizedBox(height: 10,),
                                  _buildIndicator('Low', Colors.red),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // NASA Weather Predictions section
                  Text(
                    'NASA Weather Predictions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildWeatherCard('Today', 'Sunny', Icons.wb_sunny, Colors.orange),
                        _buildWeatherCard('Monday', 'Light rain', Icons.grain, Colors.blue),
                        _buildWeatherCard('Tuesday', 'Thunder', Icons.flash_on, Colors.purple),
                        _buildWeatherCard('Wednesday', 'Midium Rain', Icons.flash_on, Colors.greenAccent),
                        _buildWeatherCard('Thursday', 'Heavy Rain', Icons.flash_on, Colors.blueAccent),
                        _buildWeatherCard('Friday', 'Thunder', Icons.flash_on, Colors.purple),
                        _buildWeatherCard('Saturday', 'Thunder', Icons.flash_on, Colors.purple),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Irrigation System section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Irrigation System',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text('Active', style: TextStyle(color: Colors.green)),
                          Switch(
                            value: true,
                            onChanged: (value) {},
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Container(width: 200, height: 5, color: Colors.black,),
                      Image(height: 50, image: AssetImage('lib/Images/waterpump.png')),
                    ],
                  ),

                  Container(
                    color: Colors.black,
                    height: 20,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }

  Widget _buildIndicator(String label, Color color) {
    return Row(
      children: [
        Card(
          child: SizedBox(height: 30,width: 30,),
          color: color,
        ),
        SizedBox(width: 8),
        Text(label),
      ],
    );
  }

  Widget _buildWeatherCard(String day, String condition, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Card(
          // margin: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(16),
          ),
            child: Container(
              decoration: BoxDecoration(
                color:  color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16)
              ),
              height: 90,
              width: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(day, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 8),
                  Icon(icon, color: color, size: 50),
                  SizedBox(height: 8),
                  Text(condition, style: TextStyle(color: color)),
                ],
              ),
            ),
        ),
    );
  }
}