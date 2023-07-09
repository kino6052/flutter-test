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
      return TProps(isLoading: true, input: '', messages: [
        ...state.messages,
        TMessage(
            text: state.input, id: generateId(), user: MessageVariant.user),
      ]);
    }
  }

  if (action.id.id == 'communication') {
    if (action.type == 'io') {
      return TProps(isLoading: false, messages: [
        ...state.messages,
        TMessage(
            text: action.payload ?? '',
            id: generateId(),
            user: MessageVariant.bot),
      ]);
    }
  }

  return state;
}
