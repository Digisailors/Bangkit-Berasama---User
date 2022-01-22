// import 'package:bangkit/models/weather.dart';
// import 'package:bangkit/services/firebase.dart';
// import 'package:http/http.dart'as http;
//
//
// class WeatherClient{
//
//   static Future<Weather>? getWeather ( double? lat, double? lang   ) async {
//     var weatheresponse =Uri.parse("https://api.openweathermap.org/data/2"
//         ".5/onecall?lat=$lat&lon=-$lang&exclude=hourly,"
//         "minutely&appid=f131f5f3c12967cd395dba531d137cc0");
//     var response =await http.get(weatheresponse);
//     var body =jsonDecode(response.body);
//
//      print(Weather.fromJson(body));
//      return Weather.fromJson(body);
//
//
//
//
//
//   }
//
// }