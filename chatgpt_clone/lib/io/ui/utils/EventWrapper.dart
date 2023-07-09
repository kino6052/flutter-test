import 'package:flutter/material.dart';

import '../../../utils/Decoupler.dart';
import '../../../main.dart';

typedef CustomWidgetBuilder = Widget Function(BuildContext,
    {void Function(String value)? onChanged,
    void Function(String value)? onFieldSubmitted});

class EventWrapperWidget extends StatelessWidget {
  final CustomWidgetBuilder child;
  final String id;

  EventWrapperWidget({required this.child, required this.id});

  void onChanged(value) {
    decoupler
        .sendAction(CAction(type: 'change', id: TId(id: id), payload: value));
  }

  void onFieldSubmitted(value) {
    decoupler.sendAction(CAction(type: 'submit', id: TId(id: id)));
  }

  @override
  Widget build(BuildContext context) {
    return this.child(context,
        onChanged: onChanged, onFieldSubmitted: onFieldSubmitted);
  }
}
