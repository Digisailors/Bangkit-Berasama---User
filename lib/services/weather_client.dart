import 'package:bangkit/models/weather.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:http/http.dart'as http;


class WeatherClient{

  Future<Weather>? GetWeather ( double? lat, double? lang   ) async {
    var weatheresponse =Uri.parse("http://api.openweathermap.org/data/2"
        ".5/onecall/timemachine?lat=$lat&lon=$lang"
        ".9&dt=1586468027&appid=f131f5f3c12967cd395dba531d137cc0");
    var response =await http.get(weatheresponse);
    var body =jsonDecode(response.body);
     print(Weather.fromJson(body).cidtyName);
     return Weather.fromJson(body);
     
    



  }

}