import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        leading: IconButton(icon: const FaIcon(FontAwesomeIcons.alignLeft), onPressed: (){SimpleHiddenDrawerController.of(context).toggle();},),
        title: const Center(child: Text('Profile Page')),
      ),

      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100,),
          Center(child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))), elevation: 50, child: CircleAvatar(radius: 90, backgroundImage: AssetImage('lib/Images/myProfile.jpg'),))),

          Center(child:
          Text('Siyam Sorkar', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),),

          SizedBox(height: 10,),

          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card.outlined(child: ListTile( leading: Icon(Icons.mail), title: Text('rksiyam479@gmail.com', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold), ),)),
                Card.outlined(child: ListTile( leading: Icon(Icons.phone), title: Text('+8801568991220', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold), ),)),
                Card.outlined(child: ListTile( leading: Icon(Icons.location_history_outlined), title: Text('Batakandi, Titas, Cumilla', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold), ),)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
