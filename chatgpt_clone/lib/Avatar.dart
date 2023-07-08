import 'package:flutter/material.dart';

enum Variant { chatGPT, you }

class Avatar extends StatelessWidget {
  final Variant variant;

  const Avatar({required Key key, required this.variant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case Variant.chatGPT:
        return SizedBox(
          height: 30,
          width: 30,
          child: Icon(
            // replace Icons.adb with the icon that you have
            Icons.adb,
            size: 30,
          ),
        );
      case Variant.you:
        return Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.orange,
          ),
          alignment: Alignment.center,
          child: Text(
            "Y",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0,
              fontFamily: 'Segoe UI-Semibold',
            ),
          ),
        );
      default:
        return SizedBox.shrink();
    }
  }
}
