import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:whatsapp_android_ui/models/messages.dart';

import 'package:whatsapp_android_ui/models/message_data.dart';

class MockFriendService {
  Future<MessageData> getMessageData() async {
    final friendMessages = await _getFriendMessages();

    return MessageData(friendMessages);
  }

  // Get the sample json data to display in the ui
  Future<List<Messages>> _getFriendMessages() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));

    // Load json from file system
    final dataString =
        await _loadAsset('assets/sample_data/sample_friends.json');

    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['friend'] != null) {
      final friend = <Messages>[];
      json['friend'].forEach((v) {
        friend.add(Messages.fromJson(v));
      });
      return friend;
    } else {
      return [];
    }
  }

  // Loads sample data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
