import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventWrapper extends StatelessWidget {
  final Widget child;

  EventWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

enum EUser {
  user,
  chatGPT,
}

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
  final EUser user;
  final String text;
  final EReaction? reaction;

  TMessage({
    required this.id,
    required this.user,
    required this.text,
    this.reaction,
  });
}

class TConversation {
  final String id;
  final String name;
  final bool? isActive;
  final EModel? model;
  final List<TMessage> messages;
  final bool? isEditing;
  final String? tempName;

  TConversation({
    required this.id,
    required this.name,
    this.isActive,
    this.model,
    required this.messages,
    this.isEditing,
    this.tempName,
  });
}

class TConversationCategory {
  final String id;
  final String category;
  final List<TConversation>? conversations;

  TConversationCategory({
    required this.id,
    required this.category,
    this.conversations,
  });
}

enum EControlId {
  expandButton,
  queryInput,
  toggle,
  newChat,
  submit,
  queryResponse,
  conversation,
  likeButton,
  dislikeButton,
  editConversation,
  removeConversation,
  shareConversation,
  conversationEditAccept,
  conversationEditCancel,
  conversationEditInput,
}

enum EStyleConstant {
  leftPanelWidth,
  transitionDuration,
}

class IconWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;

  IconWrapper({
    Key? key,
    required this.child,
    required this.padding,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.transparent),
        ),
        child: child,
      ),
      onHover: (event) {
        // Implement hover functionality here
        // Flutter doesn't fully support hover functionality as it's designed primarily for touch interfaces
      },
    );
  }
}

class Icon extends StatelessWidget {
  final IconData iconData;
  final String? className;
  final double size;
  final Color color;

  Icon({
    required this.iconData,
    required this.size,
    required this.color,
    this.className,
  });

  @override
  Widget build(BuildContext context) {
    return IconWrapper(
      padding: EdgeInsets.all(2),
      color: Colors.white,
      child: FaIcon(
        iconData,
        size: size,
        color: color,
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  final Widget child;
  final bool isOpen;
  static const double padding = 16.0;

  // Assuming EStyleConstant.TransitionDuration is in seconds and LeftPanelWidth in pixels
  static const double transitionDuration = 0.1;
  static const double leftPanelWidth = 280.0;

  SideMenu({Key? key, required this.isOpen, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: (transitionDuration * 1000).round()),
        curve: Curves.easeInOut,
        width: isOpen ? leftPanelWidth : 0,
        padding: EdgeInsets.all(padding),
        color: Color(0xFF202123),
        child: child);
  }
}

class Buttons extends StatelessWidget {
  final List<Widget> children;

  Buttons({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class SideMenuButton extends StatelessWidget {
  final Widget child;
  final bool isGrowing;
  final bool isUncollapsed;
  final Function onTap;

  SideMenuButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.isGrowing = false,
    this.isUncollapsed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: isUncollapsed ? 0 : null,
      left: isUncollapsed ? 0 : null,
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: child,
        ),
      ),
    );
  }
}
