import 'dart:math';

import 'package:chatgpt_clone/utils/Decoupler.dart';

import '../../main.dart';
import '../../types.dart';

Future<void> wait(int ms) {
  return Future.delayed(Duration(milliseconds: ms));
}

String getRandomMessage() {
  var messages = [
    "I see, I see...",
    "Hm...",
    "Are you impressed yet?",
    "Well, I don't know what to say to you",
    "Okay, okay",
    "Keep going",
    "I'm listening, go on",
    "Tell me more",
    "Is that all you have to say?",
    "Be right back",
  ];

  var index = (Random().nextDouble() * messages.length).floor();

  return messages[min(index, messages.length - 1)];
}

Future<void> handler(TProps state) async {
  if (!state.isLoading) return;

  await wait(1000);

  decoupler.sendAction(
    CAction(
      id: TId(id: 'communication'),
      type: 'io',
      payload: getRandomMessage(),
    ),
  );

  await wait(1000);
}
