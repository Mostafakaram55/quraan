
import 'package:circle_wave_progress/circle_wave_progress.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quraan/const/const.dart';
import 'package:quraan/conttrol/cubit.dart';
import 'package:quraan/conttrol/states.dart';
import 'package:quraan/moudels/hides/hides_detiles.dart';

class Hides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Quraan,ShopState>(
      listener:(context,state)=>{},
      builder: (context,state){
        int index;
        Quraan cubit=Quraan.get(context);
        return  Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: cubit.colors[cubit.colorNumber],
            title:const  Text('الأحاديث  النبوية الشريفة',textDirection: TextDirection.rtl
              ,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22
            ),),
            elevation: 9,
          ),
          body: ConditionalBuilder(
            condition: cubit.hadith!=null,
            builder: (context)=>Container(
              child: GridView.builder(
                physics:BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2 ,
                  crossAxisSpacing:1 ,
                ),
                itemBuilder: (context,index)=>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Explain(index)));
                      //cubit.changeColorIndex(index);
                    },
                    child: Material(
                      elevation: 7,
                      child: Container(
                        width: 500,
                        height: 700,
                        color:cubit.colors[cubit.colorNumber],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            Quraan.get(context).hadith.data.hadiths[index].arab,textDirection: TextDirection.rtl,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black87,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                itemCount:Quraan.get(context).hadith.data.hadiths.length ,
              ),
            ),
            fallback: (context)=>Center(
              child: CircleWaveProgress(
                   size: 150,
                 borderWidth: 10.0,
                 backgroundColor: Colors.white,
                  borderColor: Colors.grey[200],
                 waveColor: c,
                 progress: 50,
          ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            elevation: 30.0,
            notchMargin: 9.0,
            //clipBehavior: Clip.hardEdge,
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
            color: Colors.white,
          ),
        );
    },
    );
  }
}
