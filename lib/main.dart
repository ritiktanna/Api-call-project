import 'package:api_call_project/screens/home_screen_dio.dart';
import 'package:api_call_project/screens/home_screen_dio_stateless.dart';
import 'package:api_call_project/utils/app_route_strings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteStrings.initialRout,
      routes: {
        AppRouteStrings.initialRout: (context) => const HomeScreenDio(),
        AppRouteStrings.dioStateless: (context) => HomeScreenDioStateless(),
      },
    );
  }
}
