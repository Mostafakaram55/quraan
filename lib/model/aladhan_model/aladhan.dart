class aladhan {
  int code;
  String status;
  Data data;

  aladhan({this.code, this.status, this.data});

  aladhan.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}

class Data {
  Timings timings;
  Date date;
  Data({this.timings, this.date,});
  Data.fromJson(Map<String, dynamic> json) {
    timings =
    json['timings'] != null ?  Timings.fromJson(json['timings']) : null;
    date = json['date'] != null ?  Date.fromJson(json['date']) : null;
  }

}

class Timings {
  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String sunset;
  String maghrib;
  String isha;
  String imsak;
  String midnight;
  String firstthird;
  String lastthird;

  Timings(
      {this.fajr,
        this.sunrise,
        this.dhuhr,
        this.asr,
        this.sunset,
        this.maghrib,
        this.isha,
        this.imsak,
        this.midnight,
        this.firstthird,
        this.lastthird});

  Timings.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    sunset = json['Sunset'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    imsak = json['Imsak'];
    midnight = json['Midnight'];
    firstthird = json['Firstthird'];
    lastthird = json['Lastthird'];
  }

}

class Date {
  String readable;
  String timestamp;
  Hijri hijri;
  Gregorian gregorian;

  Date({this.readable, this.timestamp, this.hijri, this.gregorian});

  Date.fromJson(Map<String, dynamic> json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    hijri = json['hijri'] != null ?  Hijri.fromJson(json['hijri']) : null;
    gregorian = json['gregorian'] != null
        ?  Gregorian.fromJson(json['gregorian'])
        : null;
  }
}

class Hijri {
  String date;
  String format;
  String day;
  Weekday weekday;
  Month month;
  String year;
  Designation designation;
  List<Null> holidays;

  Hijri(
      {this.date,
        this.format,
        this.day,
        this.weekday,
        this.month,
        this.year,
        this.designation,
        //this.holidays
      });

  Hijri.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
    json['weekday'] != null ?  Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ?  Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null
        ?  Designation.fromJson(json['designation'])
        : null;
  }

}

class Weekday {
  String en;
  String ar;

  Weekday({this.en, this.ar});

  Weekday.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

}

class Month {
  int number;
  String en;
  String ar;

  Month({this.number, this.en, this.ar});

  Month.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
    ar = json['ar'];
  }

}

class Designation {
  String abbreviated;
  String expanded;

  Designation({this.abbreviated, this.expanded});

  Designation.fromJson(Map<String, dynamic> json) {
    abbreviated = json['abbreviated'];
    expanded = json['expanded'];
  }

}

class Gregorian {
  String date;
  String format;
  String day;
  Weekday weekday;
  Month month;
  String year;
  Designation designation;

  Gregorian(
      {this.date,
        this.format,
        this.day,
        this.weekday,
        this.month,
        this.year,
        this.designation});

  Gregorian.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
    json['weekday'] != null ?  Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ?  Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null
        ?  Designation.fromJson(json['designation'])
        : null;
  }

}

class weekday {
  String en;
  weekday({this.en});
  weekday.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['en'] = this.en;
    return data;
  }
}

class month {
  int number;
  String en;

  month({this.number, this.en});

  month.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
  }

}
