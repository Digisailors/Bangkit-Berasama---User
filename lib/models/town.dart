// To parse this JSON data, do
//
//     final town = townFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

Town townFromJson(String str) => Town.fromJson(json.decode(str));

String townToJson(Town data) => json.encode(data.toJson());

class Town {
  Town({
    required this.id,
    required this.name,
    required this.locationcategoryid,
    required this.locationrootid,
    this.latitude,
    this.longitude,
  });

  String id;
  String name;
  String locationcategoryid;
  String? locationrootid;
  double? latitude;
  double? longitude;

  factory Town.fromJson(Map<String, dynamic> json) => Town(
        id: json["id"],
        name: json["name"],
        locationcategoryid: json["locationcategoryid"],
        locationrootid: json["locationrootid"],
        latitude: json["latitude"] != null ? json["latitude"].toDouble() : null,
        longitude: json["longitude"] != null ? json["longitude"].toDouble() : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "locationcategoryid": locationcategoryid,
        "locationrootid": locationrootid,
        "latitude": latitude,
        "longitude": longitude,
      };

  static List<Town> latLngDistricts = [
    {
      "id": "LOCATION:23",
      "name": "MUAR",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 2.0442,
      "longitude": 102.5689
    },
    {
      "id": "LOCATION:339",
      "name": "KULAI",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 1.6626699,
      "longitude": 103.5979733
    },
    {
      "id": "LOCATION:17",
      "name": "BATU PAHAT",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 1.8548,
      "longitude": 102.9325
    },
    {
      "id": "LOCATION:603",
      "name": "TANGKAK",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 2.2732482,
      "longitude": 102.5433991
    },
    {
      "id": "LOCATION:25",
      "name": "SEGAMAT",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 2.5148,
      "longitude": 102.8158
    },
    {
      "id": "LOCATION:26",
      "name": "PONTIAN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 1.51638,
      "longitude": 103.3839109
    },
    {
      "id": "LOCATION:18",
      "name": "JOHOR BAHRU",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 1.4655,
      "longitude": 103.7578
    },
    {
      "id": "LOCATION:19",
      "name": "KLUANG",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 2.0251,
      "longitude": 103.3328
    },
    {
      "id": "LOCATION:20",
      "name": "KOTA TINGGI",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 1.7381,
      "longitude": 103.8999
    },
    {
      "id": "LOCATION:22",
      "name": "MERSING",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 2.4312,
      "longitude": 103.8405
    },
    {
      "id": "LOCATION:28",
      "name": "KUALA MUDA",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 5.56667,
      "longitude": 100.33333
    },
    {
      "id": "LOCATION:29",
      "name": "KUBANG PASU",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 6.40508,
      "longitude": 100.43982
    },
    {
      "id": "LOCATION:30",
      "name": "KULIM",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 5.32403,
      "longitude": 100.60851
    },
    {
      "id": "LOCATION:31",
      "name": "KOTA SETAR",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 6.13164,
      "longitude": 100.34853
    },
    {
      "id": "LOCATION:32",
      "name": "LANGKAWI",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 6.33333,
      "longitude": 99.75
    },
    {
      "id": "LOCATION:33",
      "name": "PADANG TERAP",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 6.24734,
      "longitude": 100.77145
    },
    {
      "id": "LOCATION:34",
      "name": "PENDANG",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 5.98458,
      "longitude": 100.60732
    },
    {
      "id": "LOCATION:35",
      "name": "POKOK SENA",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 6.17055,
      "longitude": 100.51885
    },
    {
      "id": "LOCATION:36",
      "name": "SIK",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 6.03482,
      "longitude": 100.8603
    },
    {
      "id": "LOCATION:37",
      "name": "YAN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 5.7905,
      "longitude": 100.39426
    },
    {
      "id": "LOCATION:425",
      "name": "BANDAR BAHARU",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 5.1194376,
      "longitude": 100.5220948
    },
    {
      "id": "LOCATION:27",
      "name": "BALING",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 5.67806,
      "longitude": 100.9177
    },
    {
      "id": "LOCATION:39",
      "name": "GUA MUSANG",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 4.8823,
      "longitude": 101.9644
    },
    {
      "id": "LOCATION:41",
      "name": "KOTA BHARU",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 6.05666,
      "longitude": 102.26451
    },
    {
      "id": "LOCATION:42",
      "name": "KUALA KRAI",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 5.5313,
      "longitude": 102.19925
    },
    {
      "id": "LOCATION:45",
      "name": "PASIR MAS",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 6.0424976,
      "longitude": 102.1427782
    },
    {
      "id": "LOCATION:44",
      "name": "MACHANG",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 5.76407,
      "longitude": 102.21414
    },
    {
      "id": "LOCATION:46",
      "name": "PASIR PUTEH",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 5.83333,
      "longitude": 102.4
    },
    {
      "id": "LOCATION:47",
      "name": "TANAH MERAH",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 5.66667,
      "longitude": 102
    },
    {
      "id": "LOCATION:48",
      "name": "TUMPAT",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 6.19776,
      "longitude": 102.17098
    },
    {
      "id": "LOCATION:38",
      "name": "BACHOK",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 6.06667,
      "longitude": 102.4
    },
    {
      "id": "LOCATION:40",
      "name": "JELI",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 5.71493,
      "longitude": 101.88418
    },
    {
      "id": "LOCATION:49",
      "name": "KUALA LUMPUR",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:4",
      "latitude": 3.14309,
      "longitude": 101.68653
    },
    {
      "id": "LOCATION:669",
      "name": "FP LABUAN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:5",
      "latitude": 5.3333,
      "longitude": 115.2
    },
    {
      "id": "LOCATION:51",
      "name": "ALOR GAJAH",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:6",
      "latitude": 2.3804,
      "longitude": 102.2089
    },
    {
      "id": "LOCATION:722",
      "name": "CENTRAL MELAKA",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:6",
      "latitude": null,
      "longitude": null
    },
    {
      "id": "LOCATION:52",
      "name": "JASIN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:6",
      "latitude": 2.3096,
      "longitude": 102.4281
    },
    {
      "id": "LOCATION:53",
      "name": "MELAKA TENGAH",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:6",
      "latitude": 2.1674,
      "longitude": 102.3273
    },
    {
      "id": "LOCATION:60",
      "name": "TAMPIN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 2.4701,
      "longitude": 102.2302
    },
    {
      "id": "LOCATION:54",
      "name": "JELEBU",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 3.0606425,
      "longitude": 102.133645
    },
    {
      "id": "LOCATION:55",
      "name": "JEMPOL",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 2.869634,
      "longitude": 102.4696778
    },
    {
      "id": "LOCATION:56",
      "name": "KUALA PILAH",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 2.7389,
      "longitude": 102.2487
    },
    {
      "id": "LOCATION:57",
      "name": "PORT DICKSON",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 2.5228,
      "longitude": 101.7959
    },
    {
      "id": "LOCATION:58",
      "name": "REMBAU",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 2.5897,
      "longitude": 102.0913
    },
    {
      "id": "LOCATION:59",
      "name": "SEREMBAN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 2.7297,
      "longitude": 101.9381
    },
    {
      "id": "LOCATION:63",
      "name": "CAMERON HIGHLANDS",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:8",
      "latitude": 4.469793,
      "longitude": 101.4703104
    },
    {
      "id": "LOCATION:70",
      "name": "ROMPIN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:8",
      "latitude": 2.7083,
      "longitude": 102.5047
    },
    {
      "id": "LOCATION:71",
      "name": "TEMERLOH",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:8",
      "latitude": 3.460309,
      "longitude": 102.4715911
    },
    {"id": "LOCATION:62", "name": "BERA", "locationcategoryid": "DISTRICT", "locationrootid": "LOCATION:8", "latitude": 3.33333, "longitude": 102.5},
    {
      "id": "LOCATION:66",
      "name": "LIPIS",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:8",
      "latitude": 4.3430119,
      "longitude": 101.8803489
    }
  ].map((e) => Town.fromJson(e)).toList();

  static List<Town> latlngStates = [
    {"id": "LOCATION:1", "name": "JOHOR", "locationcategoryid": "STATE", "latitude": 1.4655, "longitude": 103.7578},
    {"id": "LOCATION:2", "name": "KEDAH", "locationcategoryid": "STATE", "latitude": 6.12104, "longitude": 100.36014},
    {"id": "LOCATION:3", "name": "KELANTAN", "locationcategoryid": "STATE", "latitude": 6.05666, "longitude": 102.26451},
    {"id": "LOCATION:4", "name": "KUALA LUMPUR", "locationcategoryid": "STATE", "latitude": 3.1429996, "longitude": 101.6947998},
    {"id": "LOCATION:5", "name": "LABUAN", "locationcategoryid": "STATE", "latitude": 4.890934, "longitude": 114.942834},
    {"id": "LOCATION:6", "name": "MELAKA", "locationcategoryid": "STATE", "latitude": 2.2319263, "longitude": 102.294251},
    {"id": "LOCATION:7", "name": "NEGERI SEMBILAN", "locationcategoryid": "STATE", "latitude": 2.7297, "longitude": 101.9381},
    {"id": "LOCATION:8", "name": "PAHANG", "locationcategoryid": "STATE", "latitude": 3.8077, "longitude": 103.326},
    {"id": "LOCATION:9", "name": "PULAU PINANG", "locationcategoryid": "STATE", "latitude": 5.41123, "longitude": 100.33543},
    {"id": "LOCATION:10", "name": "PERAK", "locationcategoryid": "STATE", "latitude": 4.5841, "longitude": 101.0829},
    {"id": "LOCATION:11", "name": "PERLIS", "locationcategoryid": "STATE", "latitude": 6.4414, "longitude": 100.19862},
    {"id": "LOCATION:12", "name": "PUTRAJAYA", "locationcategoryid": "STATE", "latitude": 2.91667, "longitude": 101.7},
    {"id": "LOCATION:13", "name": "SABAH", "locationcategoryid": "STATE", "latitude": 5.9749, "longitude": 116.0724},
    {"id": "LOCATION:14", "name": "SARAWAK", "locationcategoryid": "STATE", "latitude": 1.58333, "longitude": 110.33333},
    {"id": "LOCATION:15", "name": "SELANGOR", "locationcategoryid": "STATE", "latitude": 3.08507, "longitude": 101.53281},
    {"id": "LOCATION:16", "name": "TERENGGANU", "locationcategoryid": "STATE", "latitude": 5.3302, "longitude": 103.1408},
  ].map((e) => Town.fromJson(e)).toList();

  static List<Town> list = [
    {
      "id": "LOCATION:23",
      "name": "MUAR",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 2.0442,
      "longitude": 102.5689
    },
    {
      "id": "LOCATION:339",
      "name": "KULAI",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 1.6626699,
      "longitude": 103.5979733
    },
    {
      "id": "LOCATION:17",
      "name": "BATU PAHAT",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 1.8548,
      "longitude": 102.9325
    },
    {
      "id": "LOCATION:603",
      "name": "TANGKAK",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 2.2732482,
      "longitude": 102.5433991
    },
    {
      "id": "LOCATION:25",
      "name": "SEGAMAT",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 2.5148,
      "longitude": 102.8158
    },
    {
      "id": "LOCATION:26",
      "name": "PONTIAN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 1.51638,
      "longitude": 103.3839109
    },
    {
      "id": "LOCATION:18",
      "name": "JOHOR BAHRU",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 1.4655,
      "longitude": 103.7578
    },
    {
      "id": "LOCATION:19",
      "name": "KLUANG",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 2.0251,
      "longitude": 103.3328
    },
    {
      "id": "LOCATION:20",
      "name": "KOTA TINGGI",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 1.7381,
      "longitude": 103.8999
    },
    {
      "id": "LOCATION:22",
      "name": "MERSING",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:1",
      "latitude": 2.4312,
      "longitude": 103.8405
    },
    {
      "id": "LOCATION:28",
      "name": "KUALA MUDA",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 5.56667,
      "longitude": 100.33333
    },
    {
      "id": "LOCATION:29",
      "name": "KUBANG PASU",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 6.40508,
      "longitude": 100.43982
    },
    {
      "id": "LOCATION:30",
      "name": "KULIM",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 5.32403,
      "longitude": 100.60851
    },
    {
      "id": "LOCATION:31",
      "name": "KOTA SETAR",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 6.13164,
      "longitude": 100.34853
    },
    {
      "id": "LOCATION:32",
      "name": "LANGKAWI",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 6.33333,
      "longitude": 99.75
    },
    {
      "id": "LOCATION:33",
      "name": "PADANG TERAP",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 6.24734,
      "longitude": 100.77145
    },
    {
      "id": "LOCATION:34",
      "name": "PENDANG",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 5.98458,
      "longitude": 100.60732
    },
    {
      "id": "LOCATION:35",
      "name": "POKOK SENA",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 6.17055,
      "longitude": 100.51885
    },
    {
      "id": "LOCATION:36",
      "name": "SIK",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 6.03482,
      "longitude": 100.8603
    },
    {
      "id": "LOCATION:37",
      "name": "YAN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 5.7905,
      "longitude": 100.39426
    },
    {
      "id": "LOCATION:425",
      "name": "BANDAR BAHARU",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 5.1194376,
      "longitude": 100.5220948
    },
    {
      "id": "LOCATION:27",
      "name": "BALING",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:2",
      "latitude": 5.67806,
      "longitude": 100.9177
    },
    {
      "id": "LOCATION:39",
      "name": "GUA MUSANG",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 4.8823,
      "longitude": 101.9644
    },
    {
      "id": "LOCATION:41",
      "name": "KOTA BHARU",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 6.05666,
      "longitude": 102.26451
    },
    {
      "id": "LOCATION:42",
      "name": "KUALA KRAI",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 5.5313,
      "longitude": 102.19925
    },
    {
      "id": "LOCATION:45",
      "name": "PASIR MAS",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 6.0424976,
      "longitude": 102.1427782
    },
    {
      "id": "LOCATION:44",
      "name": "MACHANG",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 5.76407,
      "longitude": 102.21414
    },
    {
      "id": "LOCATION:46",
      "name": "PASIR PUTEH",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 5.83333,
      "longitude": 102.4
    },
    {
      "id": "LOCATION:47",
      "name": "TANAH MERAH",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 5.66667,
      "longitude": 102
    },
    {
      "id": "LOCATION:48",
      "name": "TUMPAT",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 6.19776,
      "longitude": 102.17098
    },
    {
      "id": "LOCATION:38",
      "name": "BACHOK",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 6.06667,
      "longitude": 102.4
    },
    {
      "id": "LOCATION:40",
      "name": "JELI",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:3",
      "latitude": 5.71493,
      "longitude": 101.88418
    },
    {
      "id": "LOCATION:49",
      "name": "KUALA LUMPUR",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:4",
      "latitude": 3.14309,
      "longitude": 101.68653
    },
    {
      "id": "LOCATION:669",
      "name": "FP LABUAN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:5",
      "latitude": 5.3333,
      "longitude": 115.2
    },
    {
      "id": "LOCATION:51",
      "name": "ALOR GAJAH",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:6",
      "latitude": 2.3804,
      "longitude": 102.2089
    },
    {
      "id": "LOCATION:722",
      "name": "CENTRAL MELAKA",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:6",
      "latitude": null,
      "longitude": null
    },
    {
      "id": "LOCATION:52",
      "name": "JASIN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:6",
      "latitude": 2.3096,
      "longitude": 102.4281
    },
    {
      "id": "LOCATION:53",
      "name": "MELAKA TENGAH",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:6",
      "latitude": 2.1674,
      "longitude": 102.3273
    },
    {
      "id": "LOCATION:60",
      "name": "TAMPIN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 2.4701,
      "longitude": 102.2302
    },
    {
      "id": "LOCATION:54",
      "name": "JELEBU",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 3.0606425,
      "longitude": 102.133645
    },
    {
      "id": "LOCATION:55",
      "name": "JEMPOL",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 2.869634,
      "longitude": 102.4696778
    },
    {
      "id": "LOCATION:56",
      "name": "KUALA PILAH",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 2.7389,
      "longitude": 102.2487
    },
    {
      "id": "LOCATION:57",
      "name": "PORT DICKSON",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 2.5228,
      "longitude": 101.7959
    },
    {
      "id": "LOCATION:58",
      "name": "REMBAU",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 2.5897,
      "longitude": 102.0913
    },
    {
      "id": "LOCATION:59",
      "name": "SEREMBAN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:7",
      "latitude": 2.7297,
      "longitude": 101.9381
    },
    {
      "id": "LOCATION:63",
      "name": "CAMERON HIGHLANDS",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:8",
      "latitude": 4.469793,
      "longitude": 101.4703104
    },
    {
      "id": "LOCATION:70",
      "name": "ROMPIN",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:8",
      "latitude": 2.7083,
      "longitude": 102.5047
    },
    {
      "id": "LOCATION:71",
      "name": "TEMERLOH",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:8",
      "latitude": 3.460309,
      "longitude": 102.4715911
    },
    {"id": "LOCATION:62", "name": "BERA", "locationcategoryid": "DISTRICT", "locationrootid": "LOCATION:8", "latitude": 3.33333, "longitude": 102.5},
    {
      "id": "LOCATION:66",
      "name": "LIPIS",
      "locationcategoryid": "DISTRICT",
      "locationrootid": "LOCATION:8",
      "latitude": 4.3430119,
      "longitude": 101.8803489
    }
  ].map((e) => Town.fromJson(e)).toList();
}
