// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        primarySwatch: Colors.blue,
        canvasColor: Color(0xff191919),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191919),
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.settings_outlined,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.8),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: "Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: "Premium",
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _goodafternoon(context),
            _recentlyPlayed(context),
            _recommendedForYou(context),
          ],
        ),
      ),
    );
  }
}

class AlbumMini extends StatelessWidget {
  final String image;
  final String text;
  const AlbumMini({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xff1313132),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(
                image,
                filterQuality: FilterQuality.high,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

Widget _goodafternoon(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Text(
          'Good Afternoon',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 24.0),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AlbumMini(
              image: 'assets/kendrick.jpg',
              text: 'Kendrick\nLamar',
            ),
            const AlbumMini(
              image: 'assets/damn.jpg',
              text: 'Damn',
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 8.0,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            AlbumMini(image: 'assets/jcole.jpg', text: 'J. Cole'),
            AlbumMini(image: 'assets/lofi.jpeg', text: 'Lofi-Beats')
          ],
        ),
      ),
      const SizedBox(
        height: 24.0,
      ),
    ],
  );
}

Widget _recentlyPlayed(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Text(
          'Recently Played',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 24.0),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(
              width: 16.0,
            ),
            Column(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset('assets/kendrick.jpg',
                        filterQuality: FilterQuality.high),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Kendrick Lamar",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
            const SizedBox(
              width: 24.0,
            ),
            Column(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Image.asset(
                    'assets/damn.jpg',
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Damn",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: Image.asset(
                        'assets/2014.jpg',
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Text(
                      "J. Cole - 2014...",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _recommendedForYou(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 24.0,
      ),
      const Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          'Recommend for you',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 24.0),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 16.0),
            Column(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    'assets/top50global.PNG',
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  "Top 50 Global",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 24.0),
            Column(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Image.asset(
                    'assets/top50italy.PNG',
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  '"Top 50 Italy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 24.0,
            ),
            Column(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Image.asset(
                    "assets/summerRewind.PNG",
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Summer Rewind",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ],
  );
}
