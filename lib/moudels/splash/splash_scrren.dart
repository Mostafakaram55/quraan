
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quraan/moudels/test.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: const LinearGradient(
            colors: [
              Colors.white,
              Color.fromRGBO(154, 181, 208, 1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
      width: double.infinity,
      height: double.infinity,
      child: AnimatedSplashScreen(
        duration: 500,
        splashIconSize: 350,
        backgroundColor:Color.fromRGBO(154, 181, 208, 1),
        splash:const Image(
          fit: BoxFit.cover,
          image:AssetImage(
            'image/new.jpg',
          ),
        ),
        nextScreen:Test(),
      ),
    );
  }
}
