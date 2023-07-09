import 'package:chatgpt_clone/io/communication/index.dart';
import 'package:chatgpt_clone/types.dart';
import 'package:chatgpt_clone/update/update.dart';
import 'package:chatgpt_clone/utils/Decoupler.dart';
import 'package:flutter/material.dart';

import 'io/ui/App.dart';

Decoupler<TProps, String, String, String> decoupler =
    Decoupler(initialState: TProps(), update: update);

void main() {
  decoupler.registerIOHandler(handler);
  decoupler.registerIOHandler((state) =>
      runApp(FigmaToCodeApp(input: state.input, messages: state.messages)));

  decoupler.init();
}
