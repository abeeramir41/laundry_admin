import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_admin/screens/bnvmain.dart';
import 'package:flutter/material.dart';
import 'package:laundry_admin/screens/regi_page.dart';
import 'package:laundry_admin/utils/color.dart';
import 'package:laundry_admin/widgets/btn_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laundry_admin/services/auth_service.dart';
import 'package:laundry_admin/subchildscreen/additemtowash.dart';





class AddWashironmenu extends StatefulWidget {
  @override
  _AddWashironmenuState createState() => _AddWashironmenuState();
}

class _AddWashironmenuState  extends State<AddWashironmenu > {
  AuthService _authService = AuthService();
  final firestoreInstance = FirebaseFirestore.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  int group = 1 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading:  IconButton(icon: Icon(Icons.chevron_left,color: Colors.black,),onPressed: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>Washitemtomenu()));
          },),
          title: Text("Add Wash & Iron Menu Items",style: TextStyle(
            fontFamily: 'Montserrat Regular',
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,

          ),)

      ),

      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          _textEmailInput(hint: "Name", icon: Icons.title),
          _textPassInput(hint: "Price", icon: Icons.monetization_on_outlined),

          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[ Container(
                margin: EdgeInsets.only(left: 30),
                child: Text("Add Items", style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                    color: orangeColors
                ),),
              ),

                Container(
                  margin: EdgeInsets.only(right: 15),
                  alignment: Alignment.centerRight,
                  child: ButtonWidget(
                    onClick: () {


                      signIn(context);
                      emailController.clear();
                      passwordController.clear();




                    },
                    btnText: "LOGIN",
                  ),

                ),

              ],
            ),

          ),
        ],
      ),

    );

  }

  Widget _textEmailInput({controller, hint, icon}) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          controller: emailController,
          decoration: InputDecoration(

            hintText: hint, hintStyle: TextStyle(
            fontSize: 15,

          ),
            prefixIcon: Icon(icon, size: 18,),
          ),
        )
    );
  }

  Widget _textPassInput({controller, hint, icon}) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          controller: passwordController,

          decoration: InputDecoration(

            hintText: hint, hintStyle: TextStyle(
            fontSize: 15,

          ),
            prefixIcon: Icon(icon, size: 18,),
          ),
        )
    );
  }


  void signIn(BuildContext context) async {
    Random random= new Random(100);
    String no = random.nextInt(1000000).toString();

    firestoreInstance.collection("washitemtomenu").document(no).setData({
      'name': emailController.text,
      'price': passwordController.text,
      'qty' : '0',
      'image': "",

    }).then((result){
      Fluttertoast.showToast(
          msg: "Item has been Added Successfully");

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Bnvmain()
          ));
    });
  }


}

