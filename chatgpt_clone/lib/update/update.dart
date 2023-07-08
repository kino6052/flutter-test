import 'package:chatgpt_clone/types.dart';
import 'package:chatgpt_clone/utils.dart';

import '../utils/Decoupler.dart';

TProps update(TProps state, CAction<String, String, String> action) {
  if (action.id.id == 'input') {
    if (action.type == 'change') {
      return TProps(
          input: action.payload ?? state.input, messages: state.messages);
    }

    if (action.type == 'submit') {
      return TProps(input: state.input, messages: [
        TMessage(
            text: state.input, id: generateId(), user: MessageVariant.user),
        ...state.messages
      ]);
    }
  }

  return state;
}
