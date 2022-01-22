import 'package:bangkit/constants/themeconstants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bangkit/models/weather.dart';


class WeatherHome extends StatefulWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Weather.getWeather(20,75);
          }, icon: Icon(Icons.refresh))
        ],

      ),


      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('London',style: getText(context).headline3,)),
            Center(child: Text('London',style: getText(context).subtitle1,)),
            
            WeatherCard(

            ),
            
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Daily Forecast',style: TextStyle(decoration: TextDecoration.underline,fontSize:
              20,fontWeight: FontWeight.bold),),
            ),

            DailyCard(
              day: 'sunday',



            ),




          ],
        ),
      ),

    );
  }
}

class DailyCard extends StatelessWidget {
   DailyCard({
    Key? key, this.day,this.url,this.description,this.rain,this.temp,this.windspeed,
  }) : super(key: key);
  String? day;
  String? url;
  double? temp;
  String? description;
  double? windspeed;
  double? rain;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(day!,style: TextStyle(fontSize: 15),),
            ),

            ExpansionTile(
              leading:Image.network(url!),
              title: Text(temp!.toString()),
              subtitle:Text(description!) ,

              children: [
                ListTile(
                  leading: Icon(FontAwesomeIcons.wind),
                  title: Text(windspeed!.toString()),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.cloudSunRain),
                  title: Text(rain!.toString()),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.wind),
                  title: Text('50kmph'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Text('31 c',style: getText(context).headline3,)),
              Image.network("http://openweathermap.org/img/wn/10d@2x.png",),
            ],
          ),

          Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
             SizedBox(
               height: getHeight(context)*0.1,
               child: Column(
                 children: [
                   Icon(FontAwesomeIcons.cloudRain),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('30%',style: getText(context).subtitle1,),
                   ),
                 ],
               ),
             ),
              SizedBox(
                height: getHeight(context)*0.1,
                child: Column(
                  children: [
                    Icon(FontAwesomeIcons.wind),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('50kmph',style: getText(context).subtitle1,),
                    ),
                  ],
                ),
              )

            ],
          ),
        ],
      ),
    );
  }
}
