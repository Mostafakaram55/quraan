
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan/const/const.dart';
import 'package:quraan/conttrol/cubit.dart';
import 'package:quraan/conttrol/states.dart';
import 'package:quraan/moudels/test.dart';

import '../moudels/azkars/azkar_tsapeh.dart';

class Sepha extends StatelessWidget {
  final color=Color(0xFFE7ECEF);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Quraan,ShopState>(
      listener: (context,state){},
      builder: (context,state){
        Quraan cubit=Quraan.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: c,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                  'سبحة 📿',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),
              backgroundColor: c,
              elevation: 0,
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ ُ',
                        textDirection: TextDirection.rtl,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          fontFamily: 'UthmanicHafs',
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: 150,width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
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
                                color: Colors.black.withOpacity(.6),
                              ),
                            ]
                        ),
                        child:Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              '${Quraan.get(context).count}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ),
                        ) ,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: (){
                              Quraan.get(context).tasver();
                            },
                            child: Container(
                              height: 100,width: 100,
                              decoration: BoxDecoration(
                                  backgroundBlendMode: BlendMode.colorDodge,
                                  borderRadius: BorderRadius.circular(50),
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
                                      color: Colors.black.withOpacity(.6),
                                    ),
                                  ]
                              ),
                              child:Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child:Text(
                                      'تصفير↶',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                ),
                              ) ,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            splashColor: c,
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (contex)=>Tsabeh()));                          },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                backgroundBlendMode: BlendMode.colorDodge,
                                  borderRadius: BorderRadius.circular(50),
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
                                      color: Colors.black.withOpacity(.6),
                                    ),
                                  ]
                              ),
                              child:Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child:Text(
                                    'الذكر 🤲',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ) ,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: (){
                          Quraan.get(context).changesabha();
                        },
                        child: Container(
                          height: 100,width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              backgroundBlendMode: BlendMode.colorDodge,
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
                                  color: Colors.black.withOpacity(.6),
                                ),
                              ]
                          ),
                          child:Center(
                            child: Text(
                                '👆',
                              style: TextStyle(
                                fontSize: 30
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ),
        );
      },
    );
  }
}
