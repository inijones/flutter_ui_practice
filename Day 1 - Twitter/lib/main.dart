import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_training/tweets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e252f),
      appBar: AppBar(
        backgroundColor: Color(0xff1e252f),
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/dancamdev.png")),
              color: Colors.white,
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
        title: Image.asset(
          "assets/twitter.png",
          height: 30.0,
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.star_border_outlined),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bell), label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.mail), label: "")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Center(
          child: Icon(CupertinoIcons.add),
        ),
      ),
      body: ListView.builder(
        itemCount: tweets.length * 2,
        itemBuilder: ,
      ),
    );
  }
}
