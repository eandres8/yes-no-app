import 'package:flutter/material.dart';

import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {
  final GetYesNoAnswer getYNAnswer = GetYesNoAnswer();
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hello there', owner: MessageOwner.mine),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, owner: MessageOwner.mine);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );
  }

  Future<void> herReply() async {
    final herMessage = await getYNAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
  }
}
