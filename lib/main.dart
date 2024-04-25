import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/constants.dart';
import 'sitelayout.dart';


void main() {
  runApp(ExplorePixabay());
}

class ExplorePixabay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dash',
      theme: KThemeData.getTheme(context),
      home: SiteLayout(),
    );
  }
}
