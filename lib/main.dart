import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan/azkar/azkar_screen.dart';
import 'package:quraan/azkar/azkars.dart';
import 'package:quraan/const/const.dart';
import 'package:quraan/conttrol/cubit.dart';
import 'package:quraan/home/home.dart';
import 'package:quraan/model/hides_model.dart';
import 'package:quraan/moudels/Home/layout/home_layout.dart';
import 'package:quraan/moudels/aduio/pray/pray_screen.dart';

import 'package:quraan/moudels/azkars/azkar.dart';
import 'package:quraan/moudels/azkars/azkar_tsapeh.dart';
import 'package:quraan/moudels/azkars/azkarm.dart';
import 'package:quraan/moudels/clock/clock.dart';
import 'package:quraan/moudels/hides/hides_screen.dart';
import 'package:quraan/moudels/splash/splash_scrren.dart';
import 'package:quraan/moudels/test.dart';
import 'package:quraan/moudels/weather/weather_screen.dart';
import 'package:quraan/network/dio.dart';
import 'package:quraan/onBoarding/onboarding_screen.dart';
import 'all_azkars/azkars_screen.dart';
import 'model/azkar_mpdel.dart';
import 'moudels/alaname/ala_screen.dart';
import 'sepha/sepha_screen.dart';

void main() {
  DioHelper.init();
  DioHelper.initTo();
  DioHelper.initidios();
  DioHelper.iniiweather();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>Quraan()..getQuruan()..GetHides()..getAdhan()..getweather()..createDatabase(),
      child: MaterialApp(
        routes:
        {
          'rout1':(context)=>HomeScreen(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch:Colors.green,
          appBarTheme: AppBarTheme(
          )
        ),
        home:Azkar(),
      ),
    );
  }
}


