// To parse required this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:async';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'geocoding.dart';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.daily,
    this.alerts,
  });

  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;
  List<Daily> daily;
  Map<String, dynamic>? alerts;
  String? locataion;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: Current.fromJson(json["current"]),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
        alerts: json["alerts"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current.toJson(),
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
      };

  static Future<Result?> getAddress(latitude, longitude) async {
    var apiKey = "AIzaSyCtlUot-efGU2j7iLu4pYXVxnF89IXdbrQ";
    var url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey";
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var body = jsonDecode(response.body);
    var results = body["results"].map((e) => Result.fromJson(e)).toList();
    // print(results.first.toJson());
    return results.first;
  }

  static Future<Weather?> getWeather(LatLng? latLng) async {
    double lat = latLng!.latitude;
    double lng = latLng.longitude;
    var weatheresponse = Uri.parse("https://api.openweathermap.org/data/2"
        ".5/onecall?lat=$lat&lon=$lng&units=metric&exclude=hourly,"
        "minutely&appid=f131f5f3c12967cd395dba531d137cc0");
    var response = await http.get(weatheresponse);
    var body = jsonDecode(response.body);
    var returns = Weather.fromJson(body);
    return returns;
  }
}

class Current {
  Current({
    required this.dt,
    required this.temp,
    required this.humidity,
    required this.clouds,
    required this.windSpeed,
    required this.weather,
  });

  int dt;
  // int sunrise;
  // int sunset;
  double temp;
  // double feelsLike;
  // int pressure;
  int humidity;
  // double dewPoint;
  // double uvi;
  int clouds;
  // int visibility;
  double windSpeed;
  // int windDeg;
  // double? windGust;
  List<WeatherElement> weather;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        temp: json["temp"]?.toDouble(),
        humidity: json["humidity"],
        clouds: json["clouds"],
        windSpeed: json["wind_speed"]?.toDouble(),
        weather: List<WeatherElement>.from(json["weather"]?.map((x) => WeatherElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "temp": temp,
        "humidity": humidity,
        "clouds": clouds,
        "wind_speed": windSpeed,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
      };
}

class WeatherElement {
  WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  String get iconUrl => "https://openweathermap.org/img/wn/$icon@4x.png";
  String get iconMinUrl => "https://openweathermap.org/img/wn/$icon@2x.png";

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Daily {
  Daily({
    required this.dt,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
    required this.rain,
  });

  int dt;

  Temp temp;

  int humidity;

  double windSpeed;

  List<WeatherElement> weather;
  int clouds;
  double pop;
  double uvi;
  double? rain;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
      dt: json["dt"],
      temp: Temp.fromJson(json["temp"]),
      humidity: json["humidity"],
      windSpeed: json["wind_speed"].toDouble(),

      // ignore: prefer_null_aware_operators

      weather: List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromJson(x))),
      clouds: json["clouds"],
      pop: json["pop"].toDouble(),
      uvi: json["uvi"].toDouble(),
      // ignore: prefer_null_aware_operators
      rain: json["rain"] != null ? json["rain"].toDouble() : null);

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "temp": temp.toJson(),
        "humidity": humidity,
        "wind_speed": windSpeed,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds,
        "pop": pop,
        "uvi": uvi,
        "rain": rain,
      };
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

// To parse this JSON data, do
//
//     final rainWarning = rainWarningFromJson(jsonString);

RainWarning rainWarningFromJson(String str) => RainWarning.fromJson(json.decode(str));

String rainWarningToJson(RainWarning data) => json.encode(data.toJson());

class RainWarning {
  RainWarning({
    required this.date,
    required this.datatype,
    required this.value,
    this.latitude,
    this.longitude,
    required this.attributes,
  });

  DateTime date;
  String datatype;
  Value value;
  dynamic latitude;
  dynamic longitude;
  Attributes attributes;

  static Future<List<RainWarning>> getWarning() async {
    var date = DateTime.now().toString().substring(0, 10);
    var url = "https://api.met.gov.my/v2.1/data?datasetid=WARNING&datacategoryid=THUNDERSTORM&start_date=$date&end_date=$date";
    var uri = Uri.parse(
      url,
    );
    var response = await http.get(uri, headers: {"Authorization": "METToken 2504cdcf7cd349d47e1c8d67daf08938b9fcaec2"});
    List<dynamic> body = jsonDecode(response.body)["results"];
    print(body);
    return body.map((e) => RainWarning.fromJson(e)).toList();
  }

  static Future<List<RainWarning>> getRainWarning() async {
    var date = DateTime.now().toString().substring(0, 10);
    var url = "https://api.met.gov.my/v2.1/data?datasetid=WARNING&datacategoryid=RAIN&start_date=$date&end_date=$date";
    var uri = Uri.parse(
      url,
    );
    var response = await http.get(uri, headers: {"Authorization": "METToken 2504cdcf7cd349d47e1c8d67daf08938b9fcaec2"});
    List<dynamic> body = jsonDecode(response.body)["results"];
    return body.map((e) => RainWarning.fromJson(e)).toList();
  }

  factory RainWarning.fromJson(Map<String, dynamic> json) => RainWarning(
        date: DateTime.parse(json["date"]),
        datatype: json["datatype"],
        value: Value.fromJson(json["value"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "datatype": datatype,
        "value": value.toJson(),
        "latitude": latitude,
        "longitude": longitude,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.title,
    this.ref,
    required this.timestamp,
    required this.validFrom,
    required this.validTo,
  });

  Title title;
  dynamic ref;
  DateTime timestamp;
  DateTime validFrom;
  DateTime validTo;

  get englishTitle => title.en;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        title: Title.fromJson(json["title"]),
        ref: json["ref"],
        timestamp: DateTime.parse(json["timestamp"]),
        validFrom: DateTime.parse(json["valid_from"]),
        validTo: DateTime.parse(json["valid_to"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "ref": ref,
        "timestamp": timestamp.toIso8601String(),
        "valid_from": validFrom.toIso8601String(),
        "valid_to": validTo.toIso8601String(),
      };
}

class Title {
  Title({
    this.en,
    this.ms,
  });

  String? en;
  String? ms;

  get warningText => en!.substring(9, en!.length - 2);

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"].toString(),
        ms: json["ms"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ms": ms,
      };
}

class Value {
  Value({
    required this.heading,
    required this.text,
  });

  Title heading;
  Title text;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        heading: Title.fromJson(json["heading"]),
        text: Title.fromJson(json["text"]),
      );

  Map<String, dynamic> toJson() => {
        "heading": heading.toJson(),
        "text": text.toJson(),
      };
}

class En {
  En({
    required this.warning,
  });

  String warning;

  factory En.fromJson(Map<String, dynamic> json) => En(
        warning: json["warning"],
      );

  Map<String, dynamic> toJson() => {
        "warning": warning,
      };
}
