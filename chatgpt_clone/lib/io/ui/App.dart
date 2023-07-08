import 'package:flutter/material.dart';

import '../../types.dart';
import 'ChatFrame.dart';

class FigmaToCodeApp extends StatelessWidget {
  final String input;
  final List<TMessage> messages;

  const FigmaToCodeApp(
      {super.key, required this.input, required this.messages});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: App(messages: messages),
      ),
    );
  }
}

class App extends StatelessWidget {
  final List<TMessage> messages;

  const App({super.key, required this.messages});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ChatFrame(messages: messages, disabled: false, input: '');
  }
}
