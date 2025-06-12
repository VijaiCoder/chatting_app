import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble({
    super.key,
    required this.isCurrentUser,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius:
            isCurrentUser
                ? BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                )
                : BorderRadius.circular(16),
        color: isCurrentUser ? Colors.lightGreen : Colors.grey.shade400,
      ),
      child: Text(
        message,
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
