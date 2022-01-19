import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));



class Weather {
  Weather({
    this.cidtyName,
    this.temprature,
    this.presssure,
     this.raiseddDate,
    this.windSpeed,
    this.iconCode,
  });

  String? cidtyName;
  double? temprature;
  String? presssure;
  DateTime? raiseddDate;
  int? windSpeed;
  String? iconCode;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    cidtyName: json["main"]["cidtyName"],
    temprature: json["temprature"].toDouble(),
    presssure: json["presssure"],
    raiseddDate:DateTime.now(),
    windSpeed: json["windSpeed"],
    iconCode: json["iconCode"],
  );


}
