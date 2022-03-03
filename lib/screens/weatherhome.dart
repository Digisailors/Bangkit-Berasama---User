import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/controllers/location_controller.dart';
import 'package:bangkit/models/town.dart';
import 'package:bangkit/routers/home_route.dart';
import 'package:bangkit/routers/landing_page.dart';
import 'package:bangkit/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bangkit/models/weather.dart';
import 'package:get/get.dart';

import '../constants/controller_constants.dart';

class WeatherHome extends StatefulWidget {
  WeatherHome({Key? key}) : super(key: key);

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  late Town _selectedTown;
  final controller = PageController(keepPage: true);

  int index = 0;

  @override
  void initState() {
    super.initState();
    _selectedTown = Town.latLngDistricts.first;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                pageController.homeIndex = 0;
                Navigator.of(context).popAndPushNamed('/');
              }),
          // leading: IconButton(
          //   onPressed: () {
          //     // Get.to(HomePage());
          //
          //   },
          //   icon: const Icon(Icons.arrow_back_rounded),
          //   color: Colors.black,
          // ),
          // automaticallyImplyLeading: true,
          centerTitle: true,
          title: SizedBox(height: getHeight(context) * 0.15, child: Image.asset('assets/bina.png')),
          bottom: const TabBar(tabs: [
            Tab(text: "Forecast"),
            Tab(text: "Warnings"),
          ]),
        ),
        body: GetBuilder<LocationController>(
            init: locationController,
            builder: (_) {
              if (locationController.location.latitude != 0 && locationController.location.longitude != 0) {
                return FutureBuilder<Weather?>(
                    future: Weather.getWeather(locationController.location),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
                        var weather = snapshot.data;
                        return TabBarView(
                          children: [
                            ListView(
                              shrinkWrap: true,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Location : ${weather!.locataion.toString()}"),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Current Forecast',
                                    style: TextStyle(decoration: TextDecoration.underline, fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                WeatherCard(current: weather.current),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Daily Forecast',
                                    style: TextStyle(decoration: TextDecoration.underline, fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: weather.daily.map((e) => DailyCard(weatherData: e)).toList(),
                                )
                              ],
                            ),
                            Warnings(alerts: weather.alerts),
                          ],
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    });
              } else {
                return const Center(
                  child: Text("Location currently unavailable. Fetching Location..."),
                );
              }
            }),
      ),
    );
  }
}

class DailyCard extends StatelessWidget {
  DailyCard({
    Key? key,
    this.weatherData,
  }) : super(key: key);

  Daily? weatherData;

  var months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"];
  var days = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", 'sunday'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                days[DateTime.fromMillisecondsSinceEpoch(weatherData!.dt * 1000).weekday - 1].toUpperCase() +
                    "\n" +
                    months[DateTime.fromMillisecondsSinceEpoch(weatherData!.dt * 1000).month - 1].toUpperCase() +
                    " " +
                    DateTime.fromMillisecondsSinceEpoch(weatherData!.dt * 1000).day.toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ),
            ExpansionTile(
              leading: Image.network(weatherData!.weather.first.iconUrl),
              title: Text(weatherData!.temp.day.toString() + " °C"),
              subtitle: Text(weatherData!.weather.first.description),
              children: [
                ListTile(
                  leading: const Icon(FontAwesomeIcons.wind),
                  title: Text(weatherData!.windSpeed.toString() + " m/s"),
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.cloudSunRain),
                  title: weatherData!.rain == null ? const Text("No Rain Predicted") : Text(weatherData!.rain.toString() + " mm"),
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
    this.current,
  }) : super(key: key);

  final Current? current;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        // border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              Center(
                  child: Text(
                // "",
                current!.temp.toString() + " °C",
                style: getText(context).headline6,
              )),
              SizedBox(
                height: 64,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    current!.weather.first.iconMinUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(FontAwesomeIcons.cloudRain),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Humidity : " + current!.humidity.toString() + " %",
                      style: getText(context).subtitle1,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  current!.weather.first.description,
                  textAlign: TextAlign.center,
                  style: getText(context).subtitle1,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Warnings extends StatefulWidget {
  const Warnings({Key? key, this.alerts}) : super(key: key);

  final alerts;

  @override
  State<Warnings> createState() => _WarningsState();
}

class _WarningsState extends State<Warnings> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Local Warnings", style: Theme.of(context).textTheme.headline6),
          ),
          Divider(),
          if (widget.alerts == null)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("No Local Warnings Available"),
            )
          else
            Table(
              children: widget.alerts!.keys.map((e) => TableRow(children: [Text(e), Text(widget.alerts![e].toString())])).toList(),
            ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("MET Warnings", style: Theme.of(context).textTheme.headline6),
          ),
          Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<List<RainWarning>>(
                    future: RainWarning.getRainWarning(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
                        var warningList = snapshot.data;
                        if (warningList!.isEmpty) {
                          return const Text("There are no continous rain warnings");
                        }
                        return ListBody(
                          children: warningList
                              .map((e) => ExpansionTile(
                                    title: Text(e.value.heading.en!),
                                    subtitle: Table(
                                      children: [
                                        TableRow(children: [
                                          Text("Valid From : ${e.attributes.validFrom.toString().substring(0, 10)}"),
                                          Text("Valid To : ${e.attributes.validTo.toString().substring(0, 10)}"),
                                        ])
                                      ],
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(e.value.text.warningText),
                                      )
                                    ],
                                  ))
                              .toList(),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  FutureBuilder<List<RainWarning>>(
                    future: RainWarning.getWarning(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
                        var warningList = snapshot.data;
                        if (warningList!.isEmpty) {
                          return const Text("No Warnings available");
                        }
                        return ListBody(
                          children: warningList
                              .map((e) => ExpansionTile(
                                    title: Text(e.value.heading.en!),
                                    subtitle: Table(
                                      children: [
                                        TableRow(children: [
                                          Text("Valid From : ${e.attributes.validFrom.toString().substring(0, 10)}"),
                                          Text("Valid To : ${e.attributes.validTo.toString().substring(0, 10)}"),
                                        ])
                                      ],
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(e.value.text.warningText),
                                      )
                                    ],
                                  ))
                              .toList(),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
