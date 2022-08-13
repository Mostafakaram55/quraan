import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';
import 'package:quraan/const/const.dart';
import 'package:quraan/conttrol/cubit.dart';
import 'package:quraan/conttrol/states.dart';
class ayahs extends StatefulWidget {
  int numberSurahs;
  ayahs(this.numberSurahs);
  @override
  State<ayahs> createState() => _ayahsState();
}
class _ayahsState extends State<ayahs> {

  double brightness=0.0;

  bool togel=false;

  @override
  void initState() {
    super.initState();
    PlatformBrighteens();
  }
  Future<void>PlatformBrighteens()async
  {
    double bright;
    try {
      bright = await FlutterScreenWake.brightness;
    }on PlatformException{
      bright = 1.0;
    }
    if(!mounted)return;
    setState((){
      brightness=bright;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Quraan,ShopState>(
      listener: (context,state){},
      builder: (context,state){
        Quraan cubit=BlocProvider.of(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: c,
            appBar: AppBar(
              toolbarHeight: 110,
              bottom:  PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Container(
                  width: double.infinity,
                  child:   Padding(
                    padding: EdgeInsets.all(8.0),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:
                            [
                             Row(
                               children: [
                                 TextButton(
                                     onPressed: (){
                                   cubit.PlusFontSize();
                                 }, child:const Text('تكبير الخط  ',style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold
                                 ),
                                 )
                                 ),
                                 InkWell(
                                   borderRadius: BorderRadius.circular(50),
                                   onTap: (){
                                     cubit.PlusFontSize();
                                   },
                                   child: Material(
                                     elevation: 15,
                                     borderRadius: BorderRadius.circular(15),
                                     color: c,
                                     child: CircleAvatar(
                                       radius: 15,
                                       backgroundColor: Colors.amberAccent,
                                       child: Text('+',style: TextStyle(
                                         color: c,
                                         fontWeight: FontWeight.bold,
                                         fontSize: 20
                                       ),),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             Text('🕋',style: TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.bold
                             ),),
                             Row(
                               children: [
                                 TextButton(onPressed: (){
                                   cubit.MinusFontSize();
                                 }, child:const Text('  تصغير الخط',style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 16,
                                     fontWeight: FontWeight.bold
                                 ),)),
                                 Material(
                                   elevation: 15,
                                   borderRadius: BorderRadius.circular(15),
                                   color: c,
                                   child: InkWell(
                                     borderRadius: BorderRadius.circular(15),
                                     onTap: (){
                                       cubit.MinusFontSize();
                                     },
                                     child: CircleAvatar(
                                       radius: 15,
                                       backgroundColor: Colors.amberAccent,
                                       child: Text('-',style: TextStyle(
                                           color: c,
                                           fontWeight: FontWeight.bold,
                                           fontSize: 20
                                       ),),
                                     ),
                                   ),
                                 )
                               ],
                             ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            textDirection: TextDirection.ltr,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child:AnimatedCrossFade(
                                  firstChild: const Icon(Icons.brightness_7,size: 35,color: Colors.white,),
                                  secondChild: const Icon(Icons.brightness_3,size: 35,color: Colors.white,),
                                  crossFadeState: togel?CrossFadeState.showSecond:CrossFadeState.showFirst,
                                  duration:const  Duration(
                                    seconds: 1,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Slider(
                                      activeColor: Colors.amberAccent,
                                      thumbColor: Colors.white,
                                      value:brightness ,
                                      onChanged:(value){
                                        setState(() {
                                          brightness=value;
                                        });
                                        FlutterScreenWake.setBrightness(brightness);
                                        if(brightness==0){
                                          togel=true;
                                        }else{
                                          togel=false;
                                        }
                                      } ,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              flexibleSpace: Container(
                decoration: BoxDecoration(
                 color: c,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(17),
                    bottomRight: Radius.circular(17),
                  )
                ),
              ),
              centerTitle:true,
              backgroundColor: c,
              elevation: 1,
              title: Container(
                width: 120,
                child: Text(
                  cubit.autogenerated.data.surahs[widget.numberSurahs].name,
                  style: TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            body:Container(
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0) ,topRight:Radius.circular(20.0) ),
                color: c,
              ),
              child: SingleChildScrollView(
                physics:BouncingScrollPhysics(),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Container(
                      child: RichText(
                       // textAlign: cubit.autogenerated.data.surahs[numberSurahs].ayahs[numberSurahs].number<=20?TextAlign.center:TextAlign.justify,
                        text: TextSpan(
                          children: [
                            for(int i =0;i<cubit.autogenerated.data.surahs[widget.numberSurahs].ayahs.length;i++,)...{
                              TextSpan(
                                text:''+cubit.autogenerated.data.surahs[widget.numberSurahs].ayahs[i].text+'',
                                style:  TextStyle(
                                  color: Colors.white,
                                  fontSize: cubit.fontSize,
                                  fontFamily: 'UthmanicHafs',
                                  fontWeight:FontWeight.w500 ,
                                ),
                              ),
                              TextSpan(
                                text:'《${cubit.autogenerated.data.surahs[widget.numberSurahs].ayahs[i].numberInSurah.toString()}》',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.amberAccent,
                                )
                              ),
                            }
                          ],
                        ),
                      ),
                    ),
                    Image.asset('image/omquran.jpeg'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
