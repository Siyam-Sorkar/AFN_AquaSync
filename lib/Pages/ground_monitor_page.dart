import 'package:afn_aqua_sync/Utilities/Data%20Models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:provider/provider.dart';
import '../Utilities/T_H_M/iconbar.dart';
import '../Utilities/T_H_M/thermo.dart';

class GroundMonitorPage extends StatelessWidget {
  const GroundMonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        elevation: 60,
        leading: IconButton(icon:const FaIcon(FontAwesomeIcons.alignLeft), onPressed: (){
          // Navigator.of(context).pop();
          SimpleHiddenDrawerController.of(context).toggle();
          },),
        title:const Center(child: Text('Ground Monitor Page')),
      ),
      backgroundColor: Colors.green[100],
      body: const TemperatureView(),
    );
  }
}

class TemperatureView extends StatefulWidget {

  const TemperatureView({super.key});

  @override
  State<TemperatureView> createState() => _TemperatureViewState();
}

class _TemperatureViewState extends State<TemperatureView> {

  String title = "Moisture Level";
  double temp = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery
        .of(context)
        .size;
    // print('TemperatureView.build... ${size.height}');
    final style =  size.height < 600 ? textTheme.displayMedium : textTheme.displayLarge;

    return Consumer(builder: (context, value, child) =>Center(
      child: SizedBox(
        width: 400,
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Text(
                //   title,
                //   // '  ${temperature.value.toInt()}°',
                //   style: style?.copyWith(
                //     // fontSize: 70,
                //       fontWeight: FontWeight.w500, color: Colors.grey[700]),
                //   textAlign: TextAlign.center,
                // ),
                // const SizedBox(height: 3,),

                const Divider(height: 2,thickness: 3,),

                Center(
                  child: Text(
                    '${title == "Temperature" ? context.watch<DataModel>().temperature.toDouble() :
                    title == "Moisture Level" ? context.watch<DataModel>().moistureLevel.toDouble() :
                    context.watch<DataModel>().humidity.toDouble()}${title == "Temperature" ? "°C"  : "%"}',
                    style: style?.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.loose(const Size(400, 800)),
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Thermo(temperature:
                              title == "Temperature" ? context.watch<DataModel>().temperature :
                              title == "Moisture Level" ? context.watch<DataModel>().moistureLevel.toDouble() :
                              context.watch<DataModel>().humidity,scaleHeight: title == "Temperature" ? 50 : 100,
                              )
                          ),

                          // Positioned.fill(
                          //   right: 0,
                          //   bottom: 0,
                          //   child : ThermoSlider(value:
                          //   title == "Temperature" ? context.watch<DataModel>().temperature.toDouble() :
                          //   title == "Moisture Level" ? context.watch<DataModel>().moistureLevel.toDouble() :
                          //   context.watch<DataModel>().humidity.toDouble(), onValueChanged: (value) => temp = value),
                          // )

                        ],
                      ),
                    ),
                  ),
                ),
                TemperatureIconBar(
                  onTemperatureChanged: (t) {setState(() {
                    title = t;
                  });},
                )
              ],
            ),
      ),
    )
    );
  }
}