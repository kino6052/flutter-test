import 'package:chatgpt_clone/types.dart';
import 'package:flutter/material.dart';

import 'Message.dart';

class Messages extends StatefulWidget {
  final List<TMessage> messages;

  Messages({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollToEnd();
    });
  }

  @override
  void didUpdateWidget(covariant Messages oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.messages != oldWidget.messages) {
      _scrollToEnd();
    }
  }

  void _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 24, bottom: 24),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.messages.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Message(
            key: Key(widget.messages[index].id),
            message: widget.messages[index],
          );
        },
      ),
    );
  }
}
