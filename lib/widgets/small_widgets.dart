import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LiquidLinearProgressIndicator(
      value: 0.25, // Defaults to 0.5.
      valueColor: AlwaysStoppedAnimation(
        Color(0xFFE9DFCB),
      ), // Defaults to the current Theme's accentColor.
      backgroundColor: Colors
          .white, // Defaults to the current Theme's backgroundColor.
      borderColor: Color(0xFFE9DFCB),
      borderWidth: 3.0,
      borderRadius: 12.0,
      direction: Axis
          .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
      center: Text("Loading..."),
    );
  }
}

class LikeViewList extends StatelessWidget {
  String likeCount;
  String viewCount;

  LikeViewList({required this.likeCount, required this.viewCount});
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.thumb_up_alt_rounded,
          color: Colors.red,
          size: 18,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Likes:- $likeCount',
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              letterSpacing: 1),
        ),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.remove_red_eye, color: Colors.black, size: 20),
        SizedBox(
          width: 5,
        ),
        Text(
          'Views:- $viewCount',
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              letterSpacing: 1),
        ),
      ],
    );
  }
}