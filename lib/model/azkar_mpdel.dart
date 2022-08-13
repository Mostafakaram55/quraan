import 'package:flutter/foundation.dart';
class Azkarm{
  List<data>Data;
  Azkarm({
    this.Data,
});
 factory Azkarm.fromJson(Map<String,dynamic>json){
   return Azkarm(
     Data:tolostofdata(json['Data']),
   );
  }
  static List<data>tolostofdata(List<dynamic>list)
  {
    List<data> datalist=list.map((e)=>data.fromJson(e)).toList();
    return datalist;
  }
  @override
  String toString(){
   return 'all=$Data';
  }
}

class data{
  String category;
  String content;
  String description;
  data({
    this.description,
    this.category,
    this.content,
});
  factory data.fromJson(Map<String,dynamic>json){
    return data(
        category:json['category'],
        content:json['content'],
        description:json['description'],
    );
  }
}