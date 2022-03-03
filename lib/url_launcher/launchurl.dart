// import 'package:flutter/material.dart';
// // import 'package:url_launcher_ios/url_launcher_ios.dart';
// import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
//
//
//
//
// class _launchMapURL extends StatefulWidget {
//   const _launchMapURL({Key? key}) : super(key: key);
//
//   @override
//   _launchMapURLState createState() => _launchMapURLState();
// }
//
// class _launchMapURLState extends State<_launchMapURL> {
//   Future<void>? _launched;
//   String _phone = '';
//
//   Future<void> _launchInBrowser(String url) async {
//     final UrlLauncherPlatform launcher = UrlLauncherPlatform.instance;
//     if (await launcher.canLaunch("http://maps.apple.com/?address${widget.ngo.address}")) {
//       await launcher.launch(
//         url,
//         useSafariVC: false,
//         useWebView: false,
//         enableJavaScript: false,
//         enableDomStorage: false,
//         universalLinksOnly: false,
//         headers: <String, String>{'my_header_key': 'my_header_value'},
//       );
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//   }
// }
