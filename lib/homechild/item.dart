import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry_admin/screens/bnvmain.dart';
import 'package:laundry_admin/subchildscreen/additemtowash.dart';
import 'package:laundry_admin/subchildscreen/additemtoironing.dart';
import 'package:laundry_admin/subchildscreen/additemtodrycleaning.dart';
import 'package:laundry_admin/subchildscreen/additempackage.dart';





class MenuitemScreen extends StatefulWidget {
  @override
  _MenuitemScreenState createState() => _MenuitemScreenState();
}

class _MenuitemScreenState extends State<MenuitemScreen> {
  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading:  IconButton(icon: Icon(Icons.chevron_left,color: Colors.black,),onPressed: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>Bnvmain()));
          },),
          title: Text("Add Ttem To Menu",style: TextStyle(
            fontFamily: 'Montserrat Regular',
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,

          ),)

      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,

          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.13,
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        InkWell(
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/wash2.png" ,width: 100,height: 100,),
                                Text(
                                  'Add Wash & Iron',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>  Washitemtomenu()));
                          },
                        ),
                        InkWell(
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/iron1.png" ,width: 100,height: 100,),

                                Text(
                                  'Add Ironing',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Ironitemtomenu()));
                           },
                        ),

                        InkWell(
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/dry1.png" ,width: 100,height: 100,),
                                Text(
                                  'Add Dry Cleaning',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Dryitemtomenu()));
                          },
                        ),

                        InkWell(
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/pack.png" ,width: 100,height: 100,),

                                Text(
                                  'Add Packages',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                             Navigator.push(context,MaterialPageRoute(builder: (context) => AddPackagePage()));
                          },
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
