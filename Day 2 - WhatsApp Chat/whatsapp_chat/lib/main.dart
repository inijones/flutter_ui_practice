// Import the required libraries. Material Dart and Chat Bubble dependencies
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';

// Main Function to run MyApp
void main() {
  runApp(MyApp());
}

// Create the MyApp stateless widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return Material App
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(primaryColor: const Color(0xff1a5e56)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final messages = ["test"];

  @override
  Widget build(BuildContext context) {
    final isListEven = messages.length % 2 == 0;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color(0xff1a5e56),
          leading: Icon(Icons.arrow_back),
          actions: const [
            Icon(Icons.video_call, size: 25.0),
            const SizedBox(width: 16.0),
            Icon(Icons.call, size: 25.0),
            const SizedBox(width: 16.0),
            Icon(Icons.more_vert, size: 25.0),
          ],
          title: Row(
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.0),
                  image: DecorationImage(
                      image: AssetImage("assets/dancamdev.png")),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: SizedBox(
                  height: 40.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Iniobong"),
                      Text(
                        "Last seen today",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (_, index) {
                final isSender =
                    isListEven ? index % 2 == 0 : !(index % 2 == 0);

                return BubbleSpecialOne(
                  text: messages[index],
                  isSender: isSender,
                  color: isSender ? Color(0xffe2fec9) : Colors.white,
                  textStyle: TextStyle(fontSize: 18.0),
                );
              },
            ),
          ),
          const SizedBox(height: 24.0),
          _WritingRow(
            onMessageSent: (message) =>
                setState(() => messages.insert(0, message)),
          ),
          const SizedBox(height: 15),
        ]),
      ),
    );
  }
}

class _WritingRow extends StatefulWidget {
  final Function(String message) onMessageSent;
  const _WritingRow({Key? key, required this.onMessageSent}) : super(key: key);

  @override
  State<_WritingRow> createState() => __WritingRowState();
}

class __WritingRowState extends State<_WritingRow> {
  final TextEditingController controller = TextEditingController();

  bool showSend = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.emoji_emotions_outlined,
                          size: 40.0, color: Colors.grey),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Message",
                          ),
                          onChanged: (value) =>
                              setState(() => showSend = value.isNotEmpty),
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Icon(
                        Icons.attachment,
                        size: 30.0,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Icon(
                        Icons.camera_alt,
                        size: 30.0,
                        color: Colors.grey[500],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            GestureDetector(
              onTap: () {
                if (controller.text.isNotEmpty) {
                  widget.onMessageSent(controller.text);
                  controller.text = '';
                }
              },
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xff208679),
                  borderRadius: BorderRadius.circular(60.0),
                ),
                child: Center(
                  child: !showSend
                      ? Icon(Icons.mic, color: Colors.white)
                      : Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            )
          ],
        ),
      ),
    );
  }
}
