

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quraan/const/const.dart';
import 'package:quraan/conttrol/cubit.dart';
import 'package:quraan/conttrol/states.dart';

class Explain extends StatelessWidget {
  int numberHides;
  Explain(this.numberHides);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Quraan,ShopState>(
      listener: (context,state){},
      builder: (context,state){
        Quraan cubit=Quraan.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle:true,
            title: const Text('التفسير',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),),
            backgroundColor: cubit.chang,
          ),
          body: Stack(
            children: [
              SvgPicture.asset('image/background.svg',width:double.infinity,height:double.infinity,fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    child: Text(Quraan.get(context).hadith.data.hadiths[numberHides].arab,textDirection: TextDirection.rtl,style:const  TextStyle(
                        fontSize: 20
                    ),),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
