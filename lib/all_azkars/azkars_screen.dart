
import 'package:flutter/material.dart';
import 'package:quraan/const/const.dart';

import '../azkar/azkars.dart';
import '../moudels/addazkar/add_azkar.dart';
import '../moudels/alaname/ala_screen.dart';
import '../moudels/azkars/azkar.dart';
import '../moudels/azkars/azkar_morning.dart';
import '../moudels/azkars/azkar_nom.dart';
import '../moudels/azkars/azkar_tsapeh.dart';
import '../moudels/azkars/azkarm.dart';

class Azkaraz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: c,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: c,
          elevation: 1,
          title: Text('الْأَذْكَار',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (contex)=>ELAZKAR()));
                      },
                      child: Container(
                        height: 130,width: 150,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Center(
                               child: Text('أَذْكَارُ الصَّبَاحِ  ',style: TextStyle(
                                 color: Colors.white,
                                   fontSize: 22,
                                 fontWeight: FontWeight.bold
                               ),),
                             )
                            ],
                          ),
                        ) ,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),

                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (contex)=>Azkart()));
                      },
                      child: Container(
                        height: 130,width: 150,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('أَذْكَار الْمَسَاء  ',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),),
                              )

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
                      borderRadius: BorderRadius.circular(30),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (contex)=>Azkarsala()));
                      },
                      child: Container(
                        height: 130,width: 150,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('أَذْكَار بَعْدَ الصَّلَاةِ ',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),),
                              )
                            ],
                          ),
                        ) ,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),

                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (contex)=>Tsabeh()));
                      },
                      child: Container(
                        height: 130,width: 150,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('تَسابِيح  ',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),),
                              )

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

                      borderRadius: BorderRadius.circular(30),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (contex)=>Azkarnom()));                      },
                      child: Container(
                        height: 130,width: 150,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('أَذْكَار النَّوْم ',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),),
                              )
                            ],
                          ),
                        ) ,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),

                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (contex)=>Azkarmorning()));
                      },
                      child: Container(
                        height: 130,width: 150,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('أَذْكَار الِاسْتِيقَاظ ',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),),
                              )

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
                      borderRadius: BorderRadius.circular(30),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (contex)=>ADDazkar()));
                      },
                      child: Container(
                        height: 130,width: 150,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('اذكارك الْخَاصَّة  ',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),),
                              )
                            ],
                          ),
                        ) ,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (contex)=>ALaName()));
                      },
                      child: Container(
                        height: 130,width: 150,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('أَسْمَاءِ اللَّهِ',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),),
                              )

                            ],
                          ),
                        ) ,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
