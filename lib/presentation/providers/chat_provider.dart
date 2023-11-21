import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola chula", fromWho: FromWho.me),
    Message(text: "Que andas haciendo?", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(fromWho: FromWho.me, text: text);
    messageList.add(newMessage);

    notifyListeners();
  }
}
