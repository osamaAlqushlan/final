import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key});


  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsetsDirectional.only(
        start: 30,
        end: 30,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: 350.0,
      decoration:BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(30.0),
      ) ,
      child: TextButton(
        onPressed: () {  },
        child: Text(
          "No Accounts ? Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),


    );
  }
}
