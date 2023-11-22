import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: "Hola chula", fromWho: FromWho.me),
    Message(text: "Que andas haciendo?", fromWho: FromWho.me),
  ];

  Future<void> herResponse() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(fromWho: FromWho.me, text: text);
    messageList.add(newMessage);

    if (text.endsWith("?")) {
      herResponse();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(chatScrollController.position.extentTotal,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }
}
