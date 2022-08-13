
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quraan/const/const.dart';
import 'package:quraan/moudels/Home/layout/home_layout.dart';
import 'package:quraan/moudels/test.dart';

class Azkar extends StatefulWidget {

  @override
  State<Azkar> createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
  @override
  void initState() {
    Timer(Duration(seconds:3 ), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (roh)=>HomeScreen()));
    });
    super.initState();
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:t,
      body: Stack(
        alignment: Alignment.center,
        children: [
         // SvgPicture.asset('image/splash.svg',width: double.infinity,height: double.infinity,fit: BoxFit.cover,),

          //Image.asset('image/omboardingc.jpg',width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
         Container(
           width: double.infinity,
           height: double.infinity,
           color: c,
         ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'image/islamic.svg',width: 250,height: 250,),
                Text(
                  ' يقين ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'UthmanicHafs',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
