import 'dart:math';
import 'package:afn_aqua_sync/Utilities/Firebase/firebase_crud.dart';
import 'package:afn_aqua_sync/Utilities/Data%20Models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class IrrigationAnimation extends StatelessWidget {
  IrrigationAnimation({super.key});
  final FirebaseCRUD firebaseCRUD = FirebaseCRUD();

  @override
  Widget build(BuildContext context) {
    double pipeWidth = 100;

    return Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                const SizedBox(width: 280, height: 80,
                ),
                context.read<DataModel>().irrigatioinStatus ?
                Positioned(
                  left: 0,
                  top: 25,
                  child: Container(height: 60, width: 104,
                    // color: Colors.blue,
                    child: ParallaxRain (
                    dropFallSpeed: 5,
                    numberOfDrops: 5,
                    rainIsInBackground: false,
                    dropHeight: 10,
                    dropColors: [Colors.blue],
                  ),
                  ),
                ) : Container(),

                const Positioned(bottom: 0, left: 0, child: Image(height: 50, image: AssetImage('lib/Images/Rice_Plant.png'))),
                const Positioned(bottom: 0, left: 15, child: Image(height: 50, image: AssetImage('lib/Images/Rice_Plant.png'))),
                const Positioned(bottom: 0, left: 30,  child: Image(height: 50, image: AssetImage('lib/Images/Rice_Plant.png'))),
                const Positioned(bottom: 0, left: 45,  child: Image(height: 50, image: AssetImage('lib/Images/Rice_Plant.png'))),
                const Positioned(bottom: 0, left: 60,  child: Image(height: 50, image: AssetImage('lib/Images/Rice_Plant.png'))),
                const Positioned(bottom: 0, left: 75, child: Image(height: 50, image: AssetImage('lib/Images/Rice_Plant.png'))),
                const Positioned(bottom: 0, left: 90, child: Image(height: 50, image: AssetImage('lib/Images/Rice_Plant.png'))),

                context.read<DataModel>().irrigatioinStatus ?
                Positioned(
                  top: 19,
                  right: 75,
                  child: Shimmer.fromColors(
                      period: const Duration(milliseconds: 400),
                      baseColor: Colors.blue,
                      highlightColor: Colors.white,
                      enabled: true,
                      direction: ShimmerDirection.rtl,
                      child: Container(width: pipeWidth, height: 5, color: Colors.black,)
                  ),
                ) : Positioned(top: 19,right: 75, child: Container(width: pipeWidth, height: 5, color: Colors.grey[500],)),
                // Container( margin: EdgeInsets.all(2), height: 10, width: 200, child: WaterFlowLine())
                const Positioned(right: 3,top: 0, child: Image(height: 50, image: AssetImage('lib/Images/waterpump.png'))),
                Positioned(bottom: 0,right: 0, child: Container(width: 82, height: 29, color: Colors.black,)),
              ],
            ),

            const SizedBox(width: 10,),

            Transform.rotate(
              angle: pi/2,
              child: Transform.scale(
                scale: 1.5,
                child: Switch(
                  // activeTrackColor: Colors.green,
                  value: context.watch<DataModel>().irrigatioinStatus,
                  onChanged: (value) {
                    firebaseCRUD.updateFirebaseValue("Irrigating", value ? 1 : 0);
                    final toggler = context.read<DataModel>();
                    toggler.irrigationToggler(value);
                  },
                  activeColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
        Container(
          color: Colors.brown[700],
          height: 7,
          width: double.infinity,
        ),

        Container(
          color: Colors.black,
          height: 25,
          width: double.infinity,
        ),
      ],
    );
  }
}
