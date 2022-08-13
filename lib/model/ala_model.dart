class AlaName{
  List<data>Alla=[];
  AlaName.fromJson(Map<String,dynamic>json){
    if (json['data'] != null) {
      Alla = <data>[];
      json['Alla'].forEach((v) {
        Alla.add(new data.fromJson(v));
      });
    }
  }
}
class data{
  String name;
  String description;
  data.fromJson(Map<String,dynamic>json){
    name=json['name'];
    description=json['description'];
  }
}