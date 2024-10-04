import 'package:afn_aqua_sync/Utilities/irrigation_animation.dart';
import 'package:afn_aqua_sync/Utilities/progress_indicator.dart';
import 'package:afn_aqua_sync/Utilities/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../Utilities/Data Models/data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMMM dd, yyyy').format(now);

    return Consumer<DataModel>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.green[100],
          drawer: const SideDrawer(),
          appBar: AppBar(
            leading: IconButton(icon:  const FaIcon(FontAwesomeIcons.alignLeft), onPressed: (){SimpleHiddenDrawerController.of(context).toggle();},),
            actions: [IconButton(icon:  const Icon(Icons.person), onPressed: (){Navigator.pushNamed(context, "/profile");},)],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Ground Monitor Card
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Realtime Ground monitor',
                                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(formattedDate),
                                  const SizedBox(height: 20),
                                ],
                              ),

                              IconButton(onPressed: (){
                                Navigator.pushNamed(context, "/ground_monitor");
                              }, icon: const Icon(Icons.open_in_new_rounded, size: 30,))

                              // AnimatedRefreshIcon(),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    height: 270,
                                    width: 240,
                                    // color: Colors.blue,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            RoundDial(heightWidth: 80.0, data: value.temperature.toInt(), symbol: "°", onTop: true, dialName: "Temperature",),
                                            RoundDial(heightWidth: 80.0, data: value.humidity.toInt(), symbol: "%", onTop: true, dialName: "Humidity",),
                                          ],
                                        ),
                                        // SizedBox(height: 10,),
                                        RoundDial(heightWidth: 100.0, data: value.moistureLevel, symbol: "%",onTop: false, dialName: "Soil Moisture",),
                                      ],
                                    )
                                  ),
                                ],
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 100,),
                                  _buildIndicator('Optimal', Colors.green.shade900),
                                  const SizedBox(height: 10,),
                                  _buildIndicator('Warning', Colors.orange),
                                  const SizedBox(height: 10,),
                                  _buildIndicator('Low', Colors.red),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // NASA Weather Predictions section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'NASA Weather Predictions',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      IconButton(onPressed: (){
                        Navigator.pushNamed(context, "/weather_station");
                      }, icon: const Icon(Icons.open_in_new_rounded, size: 30,))
                    ],
                  ),
                  const SizedBox(height: 10),

                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildWeatherCard('Today', 'Medium Rain', Icons.flash_on, Colors.blueAccent),
                        _buildWeatherCard('Saturday', 'Light rain', Icons.grain, Colors.blue),
                        _buildWeatherCard('Sunday', 'Sunny', Icons.wb_sunny, Colors.orange),
                        _buildWeatherCard('Monday', 'Thunder', Icons.flash_on, Colors.purple),
                        _buildWeatherCard('Tuesday', 'Light rain', Icons.grain, Colors.blue),
                        _buildWeatherCard('Wednesday', 'Medium Rain', Icons.flash_on, Colors.greenAccent),
                        _buildWeatherCard('Thursday', 'Heavy Rain', Icons.flash_on, Colors.blueAccent),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Irrigation System section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Irrigation System',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 120, child: Center(child: Text(value.irrigatioinStatus ? 'Active' : 'Inactive', style: TextStyle( fontSize: 20, color:value.irrigatioinStatus ? Colors.green : Colors.red)))),
                    ],
                  ),
                  const SizedBox(height: 10),

                  IrrigationAnimation(),
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
          color: color,
          child: const SizedBox(height: 30,width: 30,),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }

  Widget _buildWeatherCard(String day, String condition, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black),
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
                  Text(day, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  Icon(icon, color: color, size: 50),
                  const SizedBox(height: 8),
                  Text(condition, style: TextStyle(color: color)),
                ],
              ),
            ),
        ),
    );
  }
}