import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ScoundScreen extends StatefulWidget {
   String email="";
   ScoundScreen({super.key,required this.email});
  static get prefs => null;
  

  @override
  State<ScoundScreen> createState() => ScoundScreenState();
}

class ScoundScreenState extends State<ScoundScreen> {
  @override



  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text("scoundryScreen"),

      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
            widget.email,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),

        ],
      ),


    );
  }


}
