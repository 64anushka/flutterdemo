import 'dart:html';
import 'package:flutter/material.dart';

 class MyHeaderDrawer extends StatefulWidget{
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context){
    return Container(
      color:const Color.fromARGB(255, 251, 75, 137),
      width:double.infinity,
      height:200,
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin:const EdgeInsets.only(bottom:10),
            height:40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
               image:DecorationImage(
                  image:AssetImage('assets/images/fc.jpg') ,
                )
              ),
          ),
          const Text("FC",style: TextStyle(
            color: Colors.white, fontSize: 20),
          ),
          Text("fergusson.edu",style: TextStyle(color: Colors.grey[200], fontSize: 14),)
        ],
      ),
    );
  } 
}