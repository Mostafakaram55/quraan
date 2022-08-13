class Azkarapp {
  List<Data> data;
  Azkarapp({this.data});
  Azkarapp.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String category;
  String count;
  String description;
  String reference;
  String content;

  Data(
      {this.category,
        this.count,
        this.description,
        this.reference,
        this.content});

  Data.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['count'] = this.count;
    data['description'] = this.description;
    data['reference'] = this.reference;
    data['content'] = this.content;
    return data;
  }
}
