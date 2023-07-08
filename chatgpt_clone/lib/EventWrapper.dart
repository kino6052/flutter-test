import 'package:flutter/material.dart';

import 'Decoupler.dart';
import 'main.dart';

typedef CustomWidgetBuilder = Widget Function(BuildContext,
    {void Function(String value)? onChanged,
    void Function(String value)? onFieldSubmitted});

class EventWrapperWidget extends StatelessWidget {
  final CustomWidgetBuilder child;

  EventWrapperWidget({required this.child});

  void onChanged(value) {
    decoupler.sendAction(
        CAction(type: 'change', id: TId(id: 'input'), payload: value));
  }

  void onFieldSubmitted(value) {
    decoupler.sendAction(CAction(type: 'submit', id: TId(id: 'input')));
  }

  @override
  Widget build(BuildContext context) {
    return this.child(context,
        onChanged: onChanged, onFieldSubmitted: onFieldSubmitted);
  }
}
