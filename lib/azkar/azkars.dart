import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan/conttrol/states.dart';

import '../const/const.dart';
import '../conttrol/cubit.dart';

class Azkarsala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<Quraan,ShopState>(
      listener: (context,stata){},
      builder:(context,state){
        Quraan cubit=Quraan.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor:c,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor:c ,
              title:  Text(
                ' اذكار بعض الصلاه  🕌',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ) ,
            ),
            body: Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              height: double.infinity,
              color: c,
              child:ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>SizedBox(
                  height: 15,
                ),
                itemBuilder:(context,index)=>Material(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft:Radius.circular(15),
                  ),
                  color: cubit.colors[cubit.colorNumber],
                  elevation: 7,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${s['slamslah'][index]['content']}',
                              maxLines: 4,
                              style: TextStyle(
                                color: c,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                wordSpacing: 2,
                                fontFamily: 'UthmanicHafs',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Material(
                                  elevation: 9,
                                  color: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: c.withOpacity(.8),
                                    child: Icon(
                                      Icons.save_alt_rounded,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                Material(
                                  elevation: 9,
                                  color: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: c.withOpacity(.8),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                Material(
                                  elevation: 9,
                                  color: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: c.withOpacity(.8),
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ) ,
                  ),
                ),
                itemCount: s['slamslah'].length,
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              elevation: 30.0,
              notchMargin: 9.0,
              child: Container(
                  width: double.infinity,
                  height: 110,
                  color: c,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder:(context,index){
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 11, right: 11, top: 50, bottom: 15),
                        child: InkWell(
                          onTap: (){
                            cubit.changeColorIndex(index);
                            cubit.chang=cubit.colors[index];
                            index=cubit.colorNumber;
                          },
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.12,
                            color: cubit.colors[index],
                            child: cubit.colorNumber==index?Icon(Icons.done):null,
                          ),
                        ),
                      );
                    },
                    itemCount: cubit.colors.length,
                  )
              ),
            ),
          ),
        );
      },
    );
  }
}
