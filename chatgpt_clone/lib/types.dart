class TProps {
  final String input;
  final List<TMessage> messages;
  final bool isLoading;

  TProps({this.input = '', this.messages = const [], this.isLoading = false});
}

enum MessageVariant { bot, user }

enum EModel {
  gpt3,
  gpt4,
}

enum EReaction {
  like,
  dislike,
}

class TMessage {
  final String id;
  final MessageVariant user;
  final String text;
  final EReaction? reaction;

  TMessage({
    required this.id,
    required this.user,
    required this.text,
    this.reaction,
  });
}
