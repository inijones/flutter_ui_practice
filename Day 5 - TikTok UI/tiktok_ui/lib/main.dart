import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.roboto().fontFamily,
        canvasColor: const Color(0xff282828),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            icon: _CreateButton(),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_outlined),
            label: "Inbox",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: "Me",
          )
        ],
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          scrollDirection: Axis.vertical,
          children: [
            Image.asset("assets/0.jpg", fit: BoxFit.cover),
            Image.asset("assets/1.jpg", fit: BoxFit.cover),
            Image.asset("assets/2.jpg", fit: BoxFit.cover),
            Image.asset("assets/3.jpg", fit: BoxFit.cover),
            Image.asset("assets/4.jpg", fit: BoxFit.cover),
            Image.asset("assets/5.jpg", fit: BoxFit.cover),
          ],
        ),
        const Align(
          alignment: Alignment.bottomLeft,
          child: _Description(),
        ),
        const Align(
          alignment: Alignment.bottomRight,
          child: _Icons(),
        )
      ],
    );
  }
}

class _Icons extends StatelessWidget {
  const _Icons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const _ProfileIcon(),
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/heart.png"),
                const SizedBox(height: 8.0),
                const Text(
                  "302.2K",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          const _Button(
            icon: Icons.chat,
            text: "2381",
          ),
          const SizedBox(height: 24.0),
          const _Button(
            icon: Icons.share_rounded,
            text: "2000",
          ),
          const SizedBox(
            height: 24.0,
          ),
          _MusicButton(),
        ],
      ),
    );
  }
}

class _MusicButton extends StatelessWidget {
  const _MusicButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 40.0,
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xfff4356d),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.elliptical(4.0, 4.0),
                        topRight: Radius.elliptical(4.0, 4.0),
                      )),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xfff4356d),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(4.0, 4.0),
                  topRight: Radius.elliptical(4.0, 4.0),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(4.0, 4.0),
                ),
              ),
            ),
          ),
          Center(
            child: Icon(Icons.add, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Button({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40.0, color: Colors.white),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "@inijones",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Text(
            "Some random reel taken from IG! Reelsception!\n#whatever #hashtags #dont #matter",
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.music_note, color: Colors.white, size: 20.0),
              SizedBox(width: 16.0),
              Text("This is the song name",
                  style: TextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }
}

class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: 60.0,
      child: Stack(
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60.0),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 25.0,
              width: 25.0,
              decoration: BoxDecoration(
                color: const Color(0xfff73859),
                borderRadius: BorderRadius.circular(60.0),
              ),
              child: const Center(
                child: Icon(Icons.add, color: Colors.white, size: 23.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
