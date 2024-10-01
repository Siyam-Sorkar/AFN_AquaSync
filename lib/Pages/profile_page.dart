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
      appBar: AppBar(
        leading: IconButton(icon: FaIcon(FontAwesomeIcons.alignLeft), onPressed: (){SimpleHiddenDrawerController.of(context).toggle();},),
        title: Center(child: Text('Profile Page')),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100,),
          Center(child: CircleAvatar(radius: 90, backgroundImage: AssetImage('lib/Images/Logo.png'),)),

          Center(child:
          Text('Leo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),),

          SizedBox(height: 10,),

          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card.outlined(child: ListTile( leading: Icon(Icons.person), title: Text('7 Months', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold), ),)),
                Card.outlined(child: ListTile( leading: Icon(Icons.mail), title: Text('leo47@meow.com', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold), ),)),
                Card.outlined(child: ListTile( leading: Icon(Icons.phone), title: Text('+8801568991220', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold), ),)),
                Card.outlined(child: ListTile( leading: Icon(Icons.location_history_outlined), title: Text('Cata velly, Leopardo City, Leo World', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold), ),)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
