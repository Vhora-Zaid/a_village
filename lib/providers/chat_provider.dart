import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatProvider extends ChangeNotifier {
  final Map<int, List<Map<String, dynamic>>> _chatMessages = {};

  List<Map<String, dynamic>> getChatMessages(int index) {
    _chatMessages.putIfAbsent(index, () => []);
    return _chatMessages[index]!;
  }

  void addInitialMessage(int index, String message) {
    if (_chatMessages[index]!.isEmpty) {
      _chatMessages[index]!.add({
        "text": message,
        "isSentByUser": false,
        "timestamp": DateFormat('h:mm a').format(DateTime.now()),
      });
      notifyListeners();
    }
  }

  void sendMessage(int index, String message) {
    if (message.isNotEmpty) {
      _chatMessages[index]!.add({
        "text": message,
        "isSentByUser": true,
        "timestamp": DateFormat('h:mm a').format(DateTime.now()),
      });
      notifyListeners();
    }
  }
}
