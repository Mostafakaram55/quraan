import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{
  static Dio dio;

  static Dio dioo;

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'http://api.alquran.cloud/v1/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static initTo(){
    dioo=Dio(
        BaseOptions(
          baseUrl: 'https://api.hadith.sutanlab.id/',
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Dio dios;

  static initidios(){
    dios=Dio(
        BaseOptions(
          baseUrl: 'https://api.aladhan.com/v1/',
          receiveDataWhenStatusError: true,
        )
    );
  }

  ///////////////////////////////////////
  //weather
  static Dio diow;

  static iniiweather(){
    diow=Dio(
        BaseOptions(
          baseUrl: 'http://api.weatherapi.com/v1',
          receiveDataWhenStatusError: true,
        )
    );
  }
  static Future<Response>getW({
  @required Map<String,dynamic>data,
})async
  {
    return await diow.get(
      '/forecast.json',
      queryParameters:data,
    );
  }


  /////////////////////////////////////

  static Future<Response>getaladan()async
  {
   return await dios.get('timingsByCity',queryParameters: {
     'city':'Cairo',
     'country':'Egypt',
     'method':'8',
   });
  }

   static Future<Response>getdata()async
  {
    return await dio.get('quran/quran-uthmani');
  }

  static Future<Response>getHides()async
  {
    return await dioo.get('books/muslim',queryParameters: {
      'range':'1-300',
    });
  }
}