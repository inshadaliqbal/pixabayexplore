import 'package:flutter/material.dart';
import 'package:explore_pixabay/constants/constants.dart';
import 'package:explore_pixabay/widgets/buttons.dart';


AppBar topBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    backgroundColor: kAppBarColor,
    actions: [
      AppBarTextField(),
      appBarButton(buttonTitle: 'SEARCH'),
    ],
    title: Text(
      'Pixabay Explore',
      style: kMainTitle,
    ),
  );
}
