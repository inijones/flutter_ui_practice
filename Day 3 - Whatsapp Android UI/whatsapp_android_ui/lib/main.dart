import 'package:flutter/material.dart';
import 'api/mock_friend_service.dart';
import 'models/message_data.dart';
import 'models/messages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final mockService = MockFriendService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xff00cc3f),
          child: Icon(Icons.chat),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff07e55),
          centerTitle: false,
          title: const Text(
            "WhatsApp",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHAT',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ]),
          actions: const [
            Icon(Icons.search, size: 30.0),
            SizedBox(width: 16.0),
            Icon(Icons.more_vert, size: 30.0),
            SizedBox(width: 16.0),
          ],
        ),
        body: FutureBuilder(
          future: mockService.getMessageData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                primary: false,
                scrollDirection: Axis.vertical,
                children: const [ChatItem()],
                itemExtent: 80.0,

                //children: chatItems,
              );
            }
          },
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ListTile(
            leading: SizedBox(
              height: 80.0,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(200.0),
                child: Image(image: AssetImage(friend.profileImageURL)),
              ),
            ),
            title: Text(),
          ),)
      ],
    );
  }
}