
import 'package:circle_wave_progress/circle_wave_progress.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quraan/conttrol/states.dart';

import '../../const/const.dart';
import '../../conttrol/cubit.dart';
class ADDazkar extends StatelessWidget {
  var controller=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Quraan,ShopState>(
      listener: (context,state){
        if(state is insertdatabaseState){
          Fluttertoast.showToast(
              msg: "تَمّ إضَافَة النَّصّ بِنَجَاح",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: c,
              textColor: Colors.white,
              fontSize:19
          );
        }
      },
      builder: (context,state){
        Quraan quran=Quraan.get(context);
        return  Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: c,
              centerTitle: true,
              title: const Text(
                  '✍  الْأَذْكَار الْخَاصَّة',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
            ),
            body:Padding(
              padding: const EdgeInsets.all(15),
              child: ConditionalBuilder(
                condition: quran.addazkars.length>0,
                builder: (context)=>ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index)=>Dismissible(
                    key: Key(quran.addazkars[index]['id'].toString()),
                    child: Container(
                      decoration:  BoxDecoration(
                        color: quran.colors[quran.colorNumber],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${quran.addazkars[index]['title']}'+'💜',
                                textDirection: TextDirection.rtl,
                                maxLines: 5,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
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
                                      radius: 22,
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
                      ),
                    ),
                    onDismissed: (direction){
                      quran.deletdata(id:quran.addazkars[index]['id']);
                    },
                  ),
                  separatorBuilder: (context,index)=>const SizedBox(
                    height: 10,
                  ),
                  itemCount: quran.addazkars.length,
                ),
                fallback: (context)=>Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu_rounded,
                      size: 70,
                      color: c,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('الْقَائِمَة فَارِغَة',style: TextStyle(
                      color: c,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: c,
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context)=>Form(
                    key:  formkey,
                    child: AlertDialog(
                      backgroundColor: Colors.grey[200],
                      title:Center(
                        child: Text('أَضِف الذَّكَر الْخَاصّ   بِك  ',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      content: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (String value){
                          if(value.isEmpty){
                            return 'من فضلك ادخل نص';
                          }else{
                            return null;
                          }
                        },
                        controller: controller,
                        maxLines: 5,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: c,
                              )
                            )
                        ),
                      ),
                      actions: [
                       Material(
                         color: Colors.transparent,
                         elevation: 9,
                         child: InkWell(
                           borderRadius: BorderRadius.circular(20),
                           onTap: (){
                             if(formkey.currentState.validate()){
                               quran.InsertTodatabase(
                                 title: controller.text,
                               ).then((value) {
                                 quran.GetDatabase(quran.database).then((value) {
                                   quran.addazkars=value;
                                   //print(quran.addazkars);
                                   Navigator.pop(context);
                                 });
                               });
                             }else{
                               return null;
                             }
                           },
                           child: CircleAvatar(
                             radius: 20,
                             backgroundColor: c,
                             child: Icon(
                               Icons.done_outline_sharp,
                               size: 15,
                               color: Colors.white,
                             ),
                           ),
                         ),
                       ),
                      ],
                    ),
                  ),
                );
              },
              child:const  Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              shape: const CircularNotchedRectangle(),
              elevation: 30.0,
              notchMargin: 9.0,
              child: Container(
                  width: double.infinity,
                  height: 110,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder:(context,index){
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 11, right: 11, top: 50, bottom: 15),
                        child: InkWell(
                          onTap: (){
                            quran.changeColorIndex(index);
                            quran.chang=quran.colors[index];
                            index=quran.colorNumber;
                          },
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.12,
                            color: quran.colors[index],
                            child: quran.colorNumber==index? Icon(Icons.done,color: c,):null,
                          ),
                        ),
                      );
                    },
                    itemCount: quran.colors.length,
                  )
              ),
            ),
          ),
        );
      },
    );
  }

}
