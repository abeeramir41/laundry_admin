import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry_admin/homechild/addorder.dart';
import 'package:laundry_admin/homechild/userslist.dart';
import 'package:laundry_admin/screens/cart.dart';
import 'package:laundry_admin/subchildscreen/additempackage.dart';
import 'package:laundry_admin/homechild/item.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/df.png')),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16,right: 16,top: 16),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,


                   child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/78/07/03/78070395106fcd1c3e66e3b3810568bb.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top:8.0,),
                              child:  Text(
                                'Welcome Back',
                                style: TextStyle(
                                    fontFamily: "Montserrat Medium",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 30.0,top: 2),
                                child:  Text(
                                  'John Richardo',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,

                                      fontFamily: "Montserrat Regular"),
                                )
                            )
                          ],
                        ),
                      )
                    ],

                  ),
                ],
              ),
                  ),

                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      padding: EdgeInsets.only(top: 20),
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
                                Image.asset("assets/images/users.png" ,width: 100,height: 100,),
                                Text(
                                  'Users',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Userlist()));
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

                       InkWell(
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/manage.png" ,width: 100,height: 100,),
                                Text(
                                  'Manage Order',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                         onTap: (){
                       //    Navigator.push(context,MaterialPageRoute(builder: (context) => AddOrder()));
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
                                Image.asset("assets/images/add.png" ,width: 80,height: 100,),

                                Text(
                                  'Add Items',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => MenuitemScreen()));
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
                                Image.asset("assets/images/noti.jpg" ,width: 100,height: 100,),

                                Text(
                                  'Manage Notification',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                           // Navigator.push(context,MaterialPageRoute(builder: (context) => AddOrder()));
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
                                Image.asset("assets/images/manage.png" ,width: 100,height: 100,),
                                Text(
                                  'Manage Order',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                          //  Navigator.push(context,MaterialPageRoute(builder: (context) => AddOrder()));
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
