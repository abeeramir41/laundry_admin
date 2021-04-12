import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry_admin/utils/color.dart';
import 'package:laundry_admin/model/voucher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_admin/screens/bnvmain.dart';
import 'package:intl/intl.dart';

class Userlist extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserlistState() ;
  }

}
class _UserlistState  extends State<Userlist>{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            title: Text("Users",style: TextStyle(
              fontFamily: 'Montserrat Regular',
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,

            ),)

        ),




        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder:(BuildContext context ,AsyncSnapshot<QuerySnapshot> snapshot,){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document){
                return Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  child:  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.1,
                    margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(4.0,4.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0),
                        BoxShadow(
                            color: Colors.white10,
                            offset: Offset(0.0,0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0),
                      ],

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container( width:45, height: 48,
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.all(Radius.circular(50))
                              ),
                              margin: EdgeInsets.only(left: 10,top: 5),
                              child: CircleAvatar( backgroundColor:orangeColors, radius: 50,
                                  child: Icon( Icons.person_outline_outlined,
                                    color: Colors.white, size: 25, )),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(top:.0),
                                    child: Text( document['name'],style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,

                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:2),
                                    child: Text(document['email'],style: TextStyle(
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.black,
                                      fontSize: 16,


                                    ),),
                                  ),

                                ],
                              ),
                            )
                          ],

                        ),Row(
                          children: [
                            IconButton(
                                onPressed:(){

                                },
                                icon: Icon(Icons.chevron_right,color: orangeColors,)
                            ),


                          ],
                        )
                      ],
                    ),
                  ),




                );



              }).toList(),

            );
          } ,
        )


    );

  }


}