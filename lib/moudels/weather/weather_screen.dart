
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quraan/conttrol/cubit.dart';
import 'package:quraan/conttrol/states.dart';
import 'package:quraan/model/weather_model/weather.dart';

import '../../const/const.dart';

class Weather extends StatelessWidget {
  var Controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Quraan,ShopState>(
      listener: (context,state){},
      builder: (context,state){
        Quraan cubit=Quraan.get(context);
        //weather w;
        return Scaffold(
          backgroundColor: c,
          appBar: AppBar(
            leading: Icon(
              Icons.menu_rounded,
            ),
            elevation: 0.0,
            centerTitle: true,
            title: Text('Weather 🌍 🌦',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),),
            backgroundColor:c,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Material(
                      elevation: 7,
                      shadowColor: Colors.purple,
                      child: TextFormField(
                        onFieldSubmitted: (text){
                          cubit.getweather(
                            name:text ,
                          );
                          if(state is LoadingweatherState)
                          print('Wite!!');
                         else print(text);
                          //print(cubit.weatherapp.location.country.toString());
                          //print(cubit.weatherapp.location.localtime.toString());
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: Controller,
                        validator: (String value)
                        {
                          if(value==null)
                          {
                            return 'Please enter Location';
                          }

                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(1, 7, 29, 3),
                            ),
                            hintText: 'Search',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.white,width: 1.7)
                            ),
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white,width: 1.7)
                            ),
                            filled: true,
                            fillColor: Colors.white
                        ),
                      ),
                    ),
                  ),
                  if(state is LoadingweatherState)
                    LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Color.fromRGBO(179, 117, 214, 1),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  if(cubit.weatherquraan==null)
                    Center(child: Text('Search Now!',style:TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight:FontWeight.bold,
                    ),),),
                  if(state is SuccessweatherState)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Today Report',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),),
                              Spacer(),
                              Text(
                                cubit.weatherquraan.location.country,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),
                              ),
                              Text(
                                ','+ cubit.weatherquraan.location.name,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                            cubit.getImage(),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          cubit.weatherquraan.current.condition.text,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          //'${DateFormat('dd-MM-yyyy').format(date)}',
                          cubit.weatherquraan.location.localtime,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          //cubit.weatherquraan.current.tempC.toString(),
                          '${cubit.weatherquraan.current.tempC.toString()}''°',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 250,
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color:c,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 20,
                                        offset: Offset(-28,-28),
                                        color: c,
                                      ),
                                      BoxShadow(
                                        blurRadius: 20,
                                        offset: Offset(5,5),
                                        color: Color.fromRGBO(179, 117, 214, 1),
                                      ),
                                    ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Max',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 26
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${cubit.weatherquraan.forecast.forecastday[0].day.maxtempC.toString()}''°',
                                        // cubit.weatherquraan.forecast.forecastday[0].day.maxtempC.toString(),
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color:c,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 20,
                                        offset: Offset(-28,-28),
                                        color: c,
                                      ),
                                      BoxShadow(
                                        blurRadius: 20,
                                        offset: Offset(5,5),
                                        color: Color.fromRGBO(179, 117, 214, 1),
                                      ),
                                    ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Min',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 26
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${cubit.weatherquraan.forecast.forecastday[0].day.mintempC.toString()}''°',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold
                                        ),),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${cubit.weatherquraan.current.windDegree.toString()}' '°',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Wind Flow',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15
                                  ),),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Text(
                                  cubit.weatherquraan.current.uv.toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('UV',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15
                                  ),),


                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Text(
                                  cubit.weatherquraan.current.pressureIn.toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('pressure',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15
                                  ),),


                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Next 24 Hours',style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 150,
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index)=>Card(
                                elevation: 9,
                                color: c,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        cubit.weatherquraan.forecast.forecastday[0].hour[index].time.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        cubit.weatherquraan.forecast.forecastday[0].hour[index].condition.text.toString(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${cubit.weatherquraan.forecast.forecastday[0].hour[index].tempC.toString()}''°',
                                        //cubit.weatherquraan.forecast.forecastday[0].hour[index].tempC.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              separatorBuilder: (context,index)=>SizedBox(width: 15,),
                              itemCount: cubit.weatherquraan.forecast.forecastday[0].hour.length,
                          ),
                        )
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
