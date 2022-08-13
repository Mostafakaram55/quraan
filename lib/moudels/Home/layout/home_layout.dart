
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:circle_wave_progress/circle_wave_progress.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quraan/conttrol/cubit.dart';
import 'package:quraan/conttrol/states.dart';
import 'package:quraan/moudels/addazkar/add_azkar.dart';
import 'package:quraan/moudels/azkars/azkar.dart';
import 'package:quraan/moudels/azkars/azkar_morning.dart';
import 'package:quraan/moudels/azkars/azkar_nom.dart';
import 'package:quraan/moudels/clock/clock.dart';
import 'package:quraan/moudels/doa/doa_nabawy.dart';
import 'package:quraan/moudels/doa/doa_screen.dart';
import 'package:quraan/moudels/hides/hides_screen.dart';
import 'package:quraan/sepha/sepha_screen.dart';

import '../../../all_azkars/azkars_screen.dart';
import '../../../azkar/azkars.dart';
import '../../../const/const.dart';
import '../../alaname/ala_screen.dart';
import '../../azkars/azkar_tsapeh.dart';
import '../../azkars/azkarm.dart';
import '../../profile/profile_screen.dart';
import '../../test.dart';
import '../../weather/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  @override

  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   Widget BuilsliverAppBar(){
     return SliverAppBar(
       toolbarHeight: 90,
       title: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           CircleAvatar(
             radius: 22,
             backgroundColor: Colors.white,
             child: IconButton(onPressed: (){
               Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (context) => Profile()));
             }, icon: Icon(
               Icons.person,
                 color: Color.fromRGBO(179, 117, 214, 2)
             )),
           ),
          Container(
            width: 150,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:Colors.transparent,
            ),
            child: Center(
              child: Text('Africa/Cairo 🌍',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                fontSize: 20
              ),),
            ),
          ),
         ],
       ),
       bottom: PreferredSize(
         preferredSize: Size.fromHeight(20),
         child:Container(
           height: 50,
           child:  Center(child:Text('يَقِين',style:TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 30,
             color: Colors.white,
             fontStyle: FontStyle.italic
           ),)),
           width: double.maxFinite,
           padding: EdgeInsets.only(top: 5,bottom: 10),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
             color: c,
           ),
         )
       ),
       elevation: 0,
       expandedHeight: 280,
       pinned: true,
       stretch: true,
       backgroundColor: c,
       flexibleSpace: FlexibleSpaceBar(
         centerTitle: true,
         background:Image.asset('image/qunew.jpg',fit:BoxFit.cover),
       ),
     );
   }
   final color=Color(0xFFE7ECEF);
   TimeOfDay _timeOfDay =TimeOfDay.now();
   @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer){
      if(_timeOfDay.minute !=TimeOfDay.now().minute){
        setState(() {
          _timeOfDay=TimeOfDay.now();
        });
      }
    });
  }
   @override
  Widget build(BuildContext context) {
     String _period=_timeOfDay.period==DayPeriod.am?'AM':'PM';
     //String pla='https://ia600908.us.archive.org/12/items/90---azan---90---azan--many----sound----mp3---alazan/019--1.mp3';
    return BlocConsumer<Quraan,ShopState>(
      listener: (context,state){},
      builder: (context,state){
        Quraan cubit=Quraan.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor:  c,
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                BuilsliverAppBar(),
                SliverList(delegate:SliverChildListDelegate(
                  [
                    ConditionalBuilder(
                      condition: Quraan.get(context).aladhans!=null,
                      builder: (context)=>Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: c,
                        ),
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children:
                          [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset('image/omquran.jpeg',width: double.infinity,
                                  height: 190,fit: BoxFit.cover,),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      //اول حاجه بتاعت التارييخdate and timing
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Container(
                                          width: 300,
                                          height: 140,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color:c,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 30,
                                                  offset: Offset(-28,-28),
                                                  color: c,
                                                ),
                                                BoxShadow(
                                                  blurRadius: 30,
                                                  offset: Offset(10,10),
                                                  color: Color.fromRGBO(179, 117, 214, 1),
                                                ),
                                              ]
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(_period,style: TextStyle(
                                                      fontSize: 10,
                                                        color: Colors.white
                                                    ),),
                                                    SizedBox(
                                                      width: 7,
                                                    ),
                                                    Text(
                                                      '${_timeOfDay.hour}:${_timeOfDay.minute}',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                        color: Colors.white
                                                      ),
                                                    ),
                                                    Text('⏰')
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        'التَّارِيخ '+':',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:FontWeight.w600
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                   cubit.aladhans.data.date.readable+' , '+ cubit.aladhans.data.date.hijri.weekday.ar,
                                                      textDirection: TextDirection.ltr,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                          fontWeight:FontWeight.w600
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        'التَّارِيخُ الهِجْرِيُّ '+':',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:FontWeight.w600
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                   cubit.aladhans.data.date.hijri.date+' , '+ cubit.aladhans.data.date.hijri.month.ar,
                                                      textDirection: TextDirection.ltr,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                          fontWeight:FontWeight.w600
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          //child:SizedBox(height: 150,width: 150,) ,
                                        ) ,
                                      ) ,
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Card(
                                            color:c,
                                            elevation: 6,
                                            shadowColor: Color.fromRGBO(179, 117, 214, 1),
                                            child: Container(
                                              width: 115,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      c,
                                                      Color.fromRGBO(179, 117, 214, 3),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  )),
                                              child: Center(child: Text('الفجر',style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 25
                                              ),)),
                                            ),
                                          ),
                                          Text(
                                            cubit.aladhans.data.timings.fajr.toString()+'AM',
                                            style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                          ),),
                                          Card(
                                            color:c,
                                            elevation: 6,
                                            shadowColor: Color.fromRGBO(179, 117, 214, 1),
                                            child: Container(
                                              width: 115,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      c,
                                                      Color.fromRGBO(179, 117, 214, 3),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  )),
                                              child: Center(child: Text('Fajr',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25
                                              ),)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 7,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Card(
                                            color:c,
                                            elevation: 6,
                                            shadowColor: Color.fromRGBO(179, 117, 214, 1),
                                            child: Container(
                                              width: 115,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      c,
                                                      Color.fromRGBO(179, 117, 214, 3),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  )),
                                              child: Center(child: Text('الشروق',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25
                                              ),)),
                                            ),
                                          ),
                                          Text(
                                            cubit.aladhans.data.timings.firstthird.toString()+'AM',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          Card(
                                            color:c,
                                            elevation: 6,
                                            shadowColor: Color.fromRGBO(179, 117, 214, 1),
                                            child: Container(
                                              width: 115,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      c,
                                                      Color.fromRGBO(179, 117, 214, 3),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  )),
                                              child: Center(child: Text('Sunrise',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25
                                              ),)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Card(
                                            color:c,
                                            elevation: 6,
                                            shadowColor: Color.fromRGBO(179, 117, 214, 1),
                                            child: Container(
                                              width: 115,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      c,
                                                      Color.fromRGBO(179, 117, 214, 3),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  )),
                                              child: Center(child: Text('الظهر',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25
                                              ),)),
                                            ),
                                          ),
                                          Text(
                                            cubit.aladhans.data.timings.dhuhr.toString()+'PM',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          Card(
                                            color:c,
                                            elevation: 6,
                                            shadowColor: Color.fromRGBO(179, 117, 214, 1),
                                            child: Container(
                                              width: 115,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      c,
                                                      Color.fromRGBO(179, 117, 214, 3),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  )),
                                              child: Center(child: Text('Dhuhr',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25
                                              ),)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Card(
                                            color:c,
                                            elevation: 6,
                                            shadowColor: Color.fromRGBO(179, 117, 214, 1),
                                            child: Container(
                                              width: 115,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      c,
                                                      Color.fromRGBO(179, 117, 214, 3),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  )),
                                              child: Center(child: Text('العصر',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25
                                              ),)),
                                            ),
                                          ),
                                          Text(
                                            cubit.aladhans.data.timings.asr.toString()+'PM',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          Card(
                                            color:c,
                                            elevation: 6,
                                            shadowColor: Color.fromRGBO(179, 117, 214, 1),
                                            child: Container(
                                              width: 115,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      c,
                                                      Color.fromRGBO(179, 117, 214, 3),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  )),
                                              child: Center(child: Text('Asr',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25
                                              ),)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Card(
                                            color:c,
                                            elevation: 6,
                                            shadowColor: Color.fromRGBO(179, 117, 214, 1),
                                            child: Container(
                                              width: 115,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      c,
                                                      Color.fromRGBO(179, 117, 214, 3),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  )),
                                              child: Center(child: Text('المغرب',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25
                                              ),)),
                                            ),
                                          ),
                                          Text(
                                            cubit.aladhans.data.timings.maghrib.toString()+'PM',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          Card(
                                            color:c,
                                            elevation: 6,
                                            shadowColor: Color.fromRGBO(179, 117, 214, 1),
                                            child: Container(
                                              width: 115,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      c,
                                                      Color.fromRGBO(179, 117, 214, 3),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  )),
                                              child: Center(child: Text('Maghrib',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25
                                              ),)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Card(
                                            color:c,
                                            elevation: 6,
                                            shadowColor: Color.fromRGBO(179, 117, 214, 1),
                                            child: Container(
                                              width: 115,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      c,
                                                      Color.fromRGBO(179, 117, 214, 3),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  )),
                                              child: Center(child: Text('العشاء',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25
                                              ),)),
                                            ),
                                          ),
                                          Text(
                                            cubit.aladhans.data.timings.isha.toString()+'PM',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          Card(
                                            color:c,
                                            elevation: 6,
                                            shadowColor: Color.fromRGBO(179, 117, 214, 1),
                                            child: Container(
                                              width: 115,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      c,
                                                      Color.fromRGBO(179, 117, 214, 3),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  )),
                                              child: Center(child: Text('Isha',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25
                                              ),)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (contex)=>Azkaraz()));

                                            },
                                            child: Container(
                                              height: 150,width: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30),
                                                  color:c,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 30,
                                                      offset: Offset(-28,-28),
                                                      color: c,
                                                    ),
                                                    BoxShadow(
                                                      blurRadius: 30,
                                                      offset: Offset(10,10),
                                                      color: Color.fromRGBO(179, 117, 214, 1),
                                                    ),
                                                  ]
                                              ),
                                              child:Padding(
                                                padding: const EdgeInsets.all(13),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Image.asset('image/qurana.jpg',width: 115,height: 60,fit: BoxFit.cover,),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            'ِالْأَذْكَار ',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                                fontStyle: FontStyle.italic
                                                            )
                                                        ),
                                                        Icon(
                                                          Icons.arrow_back_ios_sharp,
                                                          size: 20,
                                                          color: Colors.green,
                                                        )
                                                      ],
                                                    ),

                                                  ],
                                                ),
                                              ) ,
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (contex)=>Test()));
                                            },
                                            child: Container(
                                              height: 150,width: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30),
                                                  color:c,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 30,
                                                      offset: Offset(-28,-28),
                                                      color: c,
                                                    ),
                                                    BoxShadow(
                                                      blurRadius: 30,
                                                      offset: Offset(10,10),
                                                      color: Color.fromRGBO(179, 117, 214, 1),
                                                    ),
                                                  ]
                                              ),
                                              child:Padding(
                                                padding: const EdgeInsets.all(13),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Image.asset('image/quranb.jpg',width: 115,height: 60,fit: BoxFit.cover,),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Row(
                                                      children:const [
                                                        Text(
                                                            'ِ الْقُرْآنِ الْكَرِيم',
                                                            style:  TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                                fontStyle: FontStyle.italic
                                                            )
                                                        ),
                                                        Icon(
                                                          Icons.arrow_back_ios_sharp,
                                                          size: 20,
                                                          color: Colors.green,
                                                        )
                                                      ],
                                                    ),

                                                  ],
                                                ),
                                              ) ,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (contex)=>Weather()));
                                            },
                                            child: Container(
                                              height: 150,width: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30),
                                                  color:c,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 30,
                                                      offset: Offset(-28,-28),
                                                      color: c,
                                                    ),
                                                    BoxShadow(
                                                      blurRadius: 30,
                                                      offset: Offset(10,10),
                                                      color: Color.fromRGBO(179, 117, 214, 1),
                                                    ),
                                                  ]
                                              ),
                                              child:Padding(
                                                padding: const EdgeInsets.all(13),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Image.asset('image/qurand.jpg',width: 115,height: 60,fit: BoxFit.cover,),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            'الطَّقْس',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                                fontStyle: FontStyle.italic
                                                            )
                                                        ),
                                                        Icon(
                                                          Icons.arrow_back_ios_sharp,
                                                          size: 20,
                                                          color: Colors.green,
                                                        )
                                                      ],
                                                    ),

                                                  ],
                                                ),
                                              ) ,
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (contex)=>Clock()));
                                            },
                                            child: Container(
                                              height: 150,width: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30),
                                                  color:c,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 30,
                                                      offset: Offset(-28,-28),
                                                      color: c,
                                                    ),
                                                    BoxShadow(
                                                      blurRadius: 30,
                                                      offset: Offset(10,10),
                                                      color: Color.fromRGBO(179, 117, 214, 1),
                                                    ),
                                                  ]
                                              ),
                                              child:Padding(
                                                padding: const EdgeInsets.all(13),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Image.asset('image/clock.jpg',width: 115,height: 60,fit: BoxFit.cover,),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            'ِ  السَّاعَة',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                                fontStyle: FontStyle.italic
                                                            )
                                                        ),
                                                        Icon(
                                                          Icons.arrow_back_ios_sharp,
                                                          size: 20,
                                                          color: Colors.green,
                                                        )
                                                      ],
                                                    ),

                                                  ],
                                                ),
                                              ) ,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              showDialog(
                                                  context: context,
                                                  builder: (context)=>AlertDialog(
                                                    backgroundColor: c,
                                                    title: Center(
                                                      child: const Text(
                                                        'اختر نوع الدعاء',
                                                        textDirection: TextDirection.rtl,
                                                        style: TextStyle(
                                                          color: Colors.white
                                                        ),
                                                      ),
                                                    ),
                                                    actions: [
                                                      Column(
                                                        children: [
                                                          TextButton(onPressed: (){
                                                            Navigator.push(context, MaterialPageRoute(builder: (contex)=>Doa()));
                                                          }, child:const Text('أَدْعِيَة قُرْآنِيَّة',  style: TextStyle(
                                                              color: Colors.white,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 20
                                                          ),)),
                                                          TextButton(onPressed: (){
                                                            Navigator.push(context, MaterialPageRoute(builder: (contex)=>DoaNabawy()));
                                                          }, child:
                                                          const Text(
                                                            'أَدْعِيَة نَبَوِيَّة'  ,style: TextStyle(
                                                           color: Colors.white,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 20
                                                        ),))
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                              );
                                             // Navigator.push(context, MaterialPageRoute(builder: (contex)=>Doa()));
                                            },
                                            child: Container(
                                              height: 150,width: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30),
                                                  color:c,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 30,
                                                      offset: Offset(-28,-28),
                                                      color: c,
                                                    ),
                                                    BoxShadow(
                                                      blurRadius: 30,
                                                      offset: Offset(10,10),
                                                      color: Color.fromRGBO(179, 117, 214, 1),
                                                    ),
                                                  ]
                                              ),
                                              child:Padding(
                                                padding: const EdgeInsets.all(13),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Image.asset('image/doaa.jpg',width: 115,height: 60,fit: BoxFit.cover,),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            'أَدْعِيَة  ',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                                fontStyle: FontStyle.italic
                                                            )
                                                        ),
                                                        Icon(
                                                          Icons.arrow_back_ios_sharp,
                                                          size: 20,
                                                          color: Colors.green,
                                                        )
                                                      ],
                                                    ),

                                                  ],
                                                ),
                                              ) ,
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (contex)=>Sepha()));
                                            },
                                            child: Container(
                                              height: 150,width: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30),
                                                  color:c,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 30,
                                                      offset: Offset(-28,-28),
                                                      color: c,
                                                    ),
                                                    BoxShadow(
                                                      blurRadius: 30,
                                                      offset: Offset(10,10),
                                                      color: Color.fromRGBO(179, 117, 214, 1),
                                                    ),
                                                  ]
                                              ),
                                              child:Padding(
                                                padding: const EdgeInsets.all(13),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Image.asset('image/qurane.jpg',width: 115,height: 60,fit: BoxFit.cover,),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            'ِ  تَسْبِيحٌ  ',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                                fontStyle: FontStyle.italic
                                                            )
                                                        ),
                                                        Icon(
                                                          Icons.arrow_back_ios_sharp,
                                                          size: 20,
                                                          color: Colors.green,
                                                        )
                                                      ],
                                                    ),

                                                  ],
                                                ),
                                              ) ,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      fallback: (context)=>Center(child: CircleWaveProgress(
                        size: 150,
                        borderWidth: 10.0,
                        backgroundColor: Colors.white,
                        borderColor: Colors.grey[200],
                        waveColor: c,
                        progress: 50,
                      ),
                      ),
                    ),
                  ],
                ), ),
              ],
            ),
          ),
        );
      },
    );
  }
}
