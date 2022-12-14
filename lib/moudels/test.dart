import 'package:circle_wave_progress/circle_wave_progress.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quraan/const/const.dart';
import 'package:quraan/conttrol/cubit.dart';
import 'package:quraan/conttrol/states.dart';
import 'package:quraan/moudels/Home/layout/home_layout.dart';
import 'package:quraan/moudels/ayaht/ditiles.dart';

class Test extends StatelessWidget {
 final controller=ScrollController();
 int index=0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Quraan, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        Quraan cubit = BlocProvider.of(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Container(
                  width: double.infinity,
                  child:   Padding(
                    padding:  EdgeInsets.only(right: 15.0, bottom: 15.0,left: 20),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                            ' اخْتَر السُّورَة',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('يَقِين',style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),),
                          ),
                          Image.asset('image/omquran.jpeg',width: 100,
                            height: 70,fit: BoxFit.cover,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              title:Padding(
                padding: const EdgeInsets.only(
                  top: 6,
                  bottom: 6
                ),
                child: const  Text(
                  'العودة للرئيسية',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
              ),
              backgroundColor: c,
              elevation: 6,
            ),
            backgroundColor: c,
            body: ConditionalBuilder(
              condition: cubit.autogenerated != null,
              builder: (context) => ListView.separated(
                controller: controller ,
                padding: EdgeInsets.only(
                  left: 10,
                      right: 10,
                ),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Card(
                    shadowColor: Colors.black,
                    //key:itemKey,
                    elevation: 5,
                        color: Color.fromRGBO(179, 117, 214, 3),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              //color: Colors.white,
                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ayahs(index)));
                              },
                              child: Container(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  //verticalDirection: VerticalDirection.,
                                  children: [
                                    Image.asset('image/quran.png',width: 25,height: 30,),
                                    Container(
                                      height: 30,
                                      width: 80,
                                      child: Text(
                                        cubit.autogenerated.data.surahs[index].name,
                                        textDirection: TextDirection.rtl,
                                        style:  TextStyle(
                                          fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    cubit.autogenerated.data.surahs[index].revelationType=='Meccan'?Image.asset('image/kapi.jpeg',width: 50,
                                    height: 50,):Image.asset('image/rso.jpg',width: 70,height: 70,),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(cubit.autogenerated.data.surahs[index].englishName,style: const TextStyle(
                                            color: Colors.white
                                          ),),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(cubit.autogenerated.data.surahs[index].revelationType,style:const  TextStyle(
                                            color: Colors.white
                                          ),),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: c,
                                        borderRadius: BorderRadius.circular(7)
                                      ),
                                      height: 35,
                                      width: 35,
                                      child: Center(child: Text(
                                          cubit.autogenerated.data.surahs[index].number.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17
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
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 7,
                      ),
                  itemCount: cubit.autogenerated.data.surahs.length),
              fallback: (context) => Center(
                  child: CircleWaveProgress(
                  size: 150,
                 borderWidth: 10.0,
                 backgroundColor: Colors.white,
               borderColor: Color.fromRGBO(179, 117, 214, 2),
                 waveColor: c,
                 progress: 50,
              ),
             ),
            ),
            floatingActionButton: FloatingActionButton(
              splashColor: Colors.purple,
              elevation: 5,
              child:Icon(
                Icons.arrow_downward,
                color: c,
              ) ,
              onPressed:Scrolldown,
              backgroundColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
  void ScrollUp(){
    final double start =0;
    controller.animateTo(start, duration: Duration(seconds: 1), curve: Curves.easeInOut);

  }
  
  void Scrolldown(){
    final double end=controller.position.maxScrollExtent;
    controller.animateTo(end, duration: Duration(seconds: 1), curve: Curves.easeIn);

  }
}
