// To parse required this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:async';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

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
    print(results.first.toJson());
    return results.first;
  }

  static Future<Weather?> getWeather(LatLng? latLng) async {
    double lat = latLng!.latitude;
    double lng = latLng.longitude;
    var result = await getAddress(lat, lng).onError((error, stackTrace) => null);
    if (result != null) {
      var location = result.formattedAddress;
    }

    var weatheresponse = Uri.parse("https://api.openweathermap.org/data/2"
        ".5/onecall?lat=$lat&lon=-$lng&units=metric&exclude=hourly,"
        "minutely&appid=f131f5f3c12967cd395dba531d137cc0");
    var response = await http.get(weatheresponse);
    print(weatheresponse);
    var body = jsonDecode(response.body);
    var returns = Weather.fromJson(body);
    returns.locataion = result != null ? result.formattedAddress : "Could not find location";
    // print(returns.toJson());
    return returns;
  }
}

class Current {
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });

  int dt;
  int sunrise;
  int sunset;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double uvi;
  int clouds;
  int visibility;
  double windSpeed;
  int windDeg;
  double windGust;
  List<WeatherElement> weather;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"].toDouble(),
        weather: List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
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
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
    required this.rain,
  });

  int dt;
  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double moonPhase;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  double? windGust;
  List<WeatherElement> weather;
  int clouds;
  double pop;
  double uvi;
  double? rain;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
      dt: json["dt"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      moonrise: json["moonrise"],
      moonset: json["moonset"],
      moonPhase: json["moon_phase"].toDouble(),
      temp: Temp.fromJson(json["temp"]),
      feelsLike: FeelsLike.fromJson(json["feels_like"]),
      pressure: json["pressure"],
      humidity: json["humidity"],
      dewPoint: json["dew_point"].toDouble(),
      windSpeed: json["wind_speed"].toDouble(),
      windDeg: json["wind_deg"],
      // ignore: prefer_null_aware_operators
      windGust: json["wind_gust"] != null ? json["wind_gust"].toDouble() : null,
      weather: List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromJson(x))),
      clouds: json["clouds"],
      pop: json["pop"].toDouble(),
      uvi: json["uvi"].toDouble(),
      // ignore: prefer_null_aware_operators
      rain: json["rain"] != null ? json["rain"].toDouble() : null);

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp.toJson(),
        "feels_like": feelsLike.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds,
        "pop": pop,
        "uvi": uvi,
        "rain": rain,
      };
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  double day;
  double night;
  double eve;
  double morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
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
    var url = "https://api.met.gov.my/v2.1/data?datasetid=WARNING&datacategoryid=THUNDERSTORM&start_date=2022-01-23&end_date=2022-01-23";
    var uri = Uri.parse(
      url,
    );
    var response = await http.get(uri, headers: {"Authorization": "METToken 2504cdcf7cd349d47e1c8d67daf08938b9fcaec2"});
    List<dynamic> body = jsonDecode(response.body)["results"];
    return body.map((e) => RainWarning.fromJson(e)).toList();
  }

  static Future<List<RainWarning>> getRainWarning() async {
    var date = DateTime.now().toString().substring(0, 10);
    var url = "https://api.met.gov.my/v2.1/data?datasetid=WARNING&datacategoryid=RAIN&start_date=2022-01-23&end_date=2022-01-23";
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
