import 'package:flutter/material.dart';
import 'widgets/appbar.dart';
import 'package:explore_pixabay/widgets/extracted_widgets.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context, scaffoldKey),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF48423F),
        child: ImageGridView2(),
      ),
    );
  }
}
