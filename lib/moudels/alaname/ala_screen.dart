
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../const/const.dart';
import '../../conttrol/cubit.dart';
import '../../conttrol/states.dart';

class ALaName extends StatelessWidget {

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
                'أسماء الله ',
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
                itemBuilder:(context,index)=>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    shadowColor: Colors.black,
                    elevation: 9,
                    color:c ,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '《  ${alaName['Alla'][index]['name']}  》',
                                  //'${alaName['Alla'][index]['name']}',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                  color: Colors.purpleAccent,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                    fontFamily: 'UthmanicHafs',
                                ),),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                '${alaName['Alla'][index]['description']}',
                                maxLines: 8,
                                style: TextStyle(
                                  color:Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  wordSpacing: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ) ,
                    ),
                  ),
                ),
                itemCount: alaName['Alla'].length,
              ),
            ),
          ),
        );
      },
    );
  }
}
