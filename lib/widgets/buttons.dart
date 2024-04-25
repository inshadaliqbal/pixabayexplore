import 'package:explore_pixabay/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:explore_pixabay/controllers/main_get_controller.dart';
import 'package:get/get.dart';
import 'package:easy_debounce/easy_debounce.dart';

class appBarButton extends StatelessWidget {
  String buttonTitle;
  appBarButton({super.key, required this.buttonTitle});
  @override
  Widget build(BuildContext context) {
    MainGetController mainGetController = Get.put(MainGetController());
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
      child: Container(
        decoration: kButtonBoxDecoration,
        child: Material(
          color: Colors.transparent, // Set material color to transparent
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: () {
              mainGetController.forUpdate();
            },
            minWidth: 120.0,
            height: 42.0,
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarTextField extends StatelessWidget {
  MainGetController mainGetController = Get.put(MainGetController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      height: 5,
      width: 250,
      child: TextField(
        onChanged: (text) {
          mainGetController.addInputTextData(text);
          EasyDebounce.debounce('my-debouncer', Duration(seconds: 10),
              () => mainGetController.forUpdate());
        },
        textAlignVertical: TextAlignVertical.bottom,
        cursorColor: Colors.black38,
        decoration: kTextFieldInputDecoration,
      ),
    );
  }
}
