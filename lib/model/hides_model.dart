class Hadith {
  int code;
  String message;
  Data data;
  bool error;


  Hadith.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

}

class Data {
  String name;
  String id;
  int available;
  int requested;
  List<Hadiths> hadiths;


  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    available = json['available'];
    requested = json['requested'];
    if (json['hadiths'] != null) {
      hadiths = <Hadiths>[];
      json['hadiths'].forEach((v) {
        hadiths.add(new Hadiths.fromJson(v));
      });
    }
  }

}

class Hadiths {
  int number;
  String arab;
  String id;


  Hadiths.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    arab = json['arab'];
    id = json['id'];
  }

}
