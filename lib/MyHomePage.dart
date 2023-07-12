import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/SmartDevicesBox.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List MysmartDevice = [
   ['Smart Light','assets/icons/icons8-light-64.png',true],
    ['Smart AC','assets/icons/icons8-air-conditioner-50.png',false],
    ['Smart TV','assets/icons/icons8-smart-tv-64.png',false],
    ['Smart Fan','assets/icons/icons8-fan-50.png',false],
  ];

  void PowerSwitchChanged(bool value,int index){
    setState(() {
      MysmartDevice[index][2]=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(child:
      Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 40,vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Image.asset(
                  "assets/icons/menu.png",
                  height: 45,
                  color: Colors.grey[800],
                ),
              Icon(Icons.person,size: 45,color: Colors.grey[800],)
              ],
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 25 ),
            child: Column(
              children: [
                Text('Welcome Home',
                  style: TextStyle(
                    fontSize: 20,color: Colors.grey.shade800
                  ),
                ),
                Text('Flutter UI',
                  style: GoogleFonts.bebasNeue(fontSize: 72),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(
              thickness: 1,
              color: Color.fromARGB(255, 204, 204, 204),
            ),
          ),
          SizedBox(height: 10,),
          
          Text('Smart Devices',style: TextStyle(fontSize: 20,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/1.3,

            ),
            itemCount: MysmartDevice.length ,

            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder:  (context,index){
              return SmartDevicesBox(
                  smartDevicesName: MysmartDevice[index][0],
                  iconPath: MysmartDevice[index][1],
                 powerOn: MysmartDevice[index][2],
                onChanged: (value)=>PowerSwitchChanged(value,index)

              );
              },
            ),
          )
        ],
      )),
    );
  }
}
