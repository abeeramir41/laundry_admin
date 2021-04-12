import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_admin/screens/bnvmain.dart';
import 'package:flutter/material.dart';
import 'package:laundry_admin/screens/regi_page.dart';
import 'package:laundry_admin/utils/color.dart';
import 'package:laundry_admin/widgets/btn_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laundry_admin/services/auth_service.dart';





class AddPackagePage extends StatefulWidget {
  @override
  _AddpackageState  createState() => _AddpackageState();
}

class _AddpackageState  extends State<AddPackagePage > {
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
                    builder: (context) =>Bnvmain()));
          },),
          title: Text("Add Package",style: TextStyle(
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

                      _textEmailInput(hint: "Title", icon: Icons.title),
                      _textPassInput(hint: "Code", icon: Icons.code),

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[ Container(
                            margin: EdgeInsets.only(left: 30),
                            child: Text("Add Voucher", style: TextStyle(
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
    String no = random.nextInt(1000).toString();

    firestoreInstance.collection('vouchers').document(no).setData({
      'title': emailController.text,
      'code': passwordController.text,

    }).then((result){
      Fluttertoast.showToast(
          msg: "Voucher has been Added Successfully");

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Bnvmain()
          ));
    });
  }


}

