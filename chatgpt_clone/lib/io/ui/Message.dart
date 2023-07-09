import 'package:chatgpt_clone/types.dart';
import 'package:chatgpt_clone/utils.dart';
import 'package:flutter/material.dart';
import 'Avatar.dart'; // ensure to replace with the correct path to your Avatar widget

class Message extends StatelessWidget {
  final TMessage message;

  const Message({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      width: 343.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: const Color(0x33CDCDCD), width: 1),
        ),
        color: message.user == MessageVariant.bot
            ? const Color(0xFF2E2F3A)
            : const Color(0xFF444654),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Avatar(
            key: Key(message.id),
            variant: message.user == MessageVariant.user
                ? Variant.you
                : Variant.chatGPT,
            // specify additional properties here
          ),
          const SizedBox(width: 16.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
