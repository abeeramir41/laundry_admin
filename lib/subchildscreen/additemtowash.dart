import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry_admin/utils/color.dart';
import 'package:laundry_admin/model/voucher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:laundry_admin/screens/bnvmain.dart';
import 'package:laundry_admin/menuitemsadd/addwashmenu.dart';

class Washitemtomenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WashitemtomenuState() ;
  }

}
class _WashitemtomenuState  extends State<Washitemtomenu >{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar:  AppBar(
           backgroundColor: Colors.transparent,
           elevation: 0,
           centerTitle: true,
           leading:  IconButton(icon: Icon(Icons.chevron_left,color: Colors.black,),onPressed: (){
             Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(
                     builder: (context) =>Bnvmain()));
           },),
           title: Text("Add Wash & Iron Menu Item",style: TextStyle(
             fontFamily: 'Montserrat Regular',
             color: Colors.black,
             fontSize: 16,
             fontWeight: FontWeight.w500,

           ),)

       ),




        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("washitemtomenu").snapshots(),
          builder:(BuildContext context ,AsyncSnapshot<QuerySnapshot> snapshot,){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document){
                return Container(
                  width: double.infinity,
                  height: 60,
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
                          Image.asset( document['image'],width: 100,height: 100,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Text(document['name'],style: TextStyle(
                                  fontFamily: 'Montserrat Regular',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,

                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0,top: 2),
                                child: Text( document['price']+ " Rs"" ",style: TextStyle(
                                  fontFamily: 'Montserrat Regular',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,

                                ),),
                              )
                            ],
                          )
                        ],

                      ),Row(
                        children: [
                          IconButton(
                              onPressed:(){

                              },
                              icon: Icon(Icons.edit_outlined,color: orangeColors,)
                          ),


                        ],
                      )
                    ],
                  ),
                );



              }).toList(),

            );
          } ,
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

        backgroundColor: orangeColors,
        hoverColor: orangeLightColors,
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>AddWashironmenu()));
        },

      ),

    );

  }


}