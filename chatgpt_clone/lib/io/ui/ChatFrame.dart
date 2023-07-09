import 'package:chatgpt_clone/types.dart';
import 'package:flutter/material.dart';

import 'utils/EventWrapper.dart';
import 'Messages.dart';

class ChatFrame extends StatelessWidget {
  final bool disabled;
  final String input;
  final List<TMessage> messages;

  ChatFrame({
    required this.disabled,
    required this.input,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[850],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              "Figma Chat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Messages(
              messages: messages,
            ),
          ),
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[700],
                border: Border.all(
                  color: Colors.grey[400]!,
                  width: 2,
                ),
              ),
              child: EventWrapperWidget(
                  id: 'input',
                  child: (BuildContext context,
                      {void Function(String value)? onChanged,
                      void Function(String value)? onFieldSubmitted}) {
                    return TextField(
                        onChanged: onChanged,
                        onSubmitted: onFieldSubmitted,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ));
                  }))
        ],
      ),
    );
  }
}
