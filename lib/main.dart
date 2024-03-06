import 'dart:ffi';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:nike_app/cart.dart';
import 'package:nike_app/description.dart';

import 'color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nike App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const NikeApp(),
    );
  }
}

class NikeApp extends StatefulWidget {
  const NikeApp({Key? key}) : super(key: key);

  @override
  State<NikeApp> createState() => _NikeAppState();
}

class _NikeAppState extends State<NikeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black87,
              )),
        ),
        backgroundColor: bgColor,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black87,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_alt_outlined,
                color: Colors.black87,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cart()),
                  );
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black87,
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          //Shoes tag and sort icon
          labelHeaderTexts(
            fontSize: 30,
            largeText: 'Shoes',
            smallText: 'Sort by',
          ),

          //Shoe displays
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Container(
              height: 505.0,
              width: double.infinity,
              color: bgColor,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  ShoeCard(
                    image: 'assets/shoe_1.png',
                    shoeName: 'Nike Air Max 270React',
                    shoePrice: '€270.49',
                    heroTag: 'tagOne',
                  ),
                  ShoeCard(
                    image: 'assets/shoe_2.png',
                    shoeName: 'Nike Air Max 97',
                    shoePrice: '€299.00',
                    heroTag: 'tagTwo',
                  ),
                  ShoeCard(
                    image: 'assets/shoe_1.png',
                    shoeName: 'Nike Air Max 270React',
                    shoePrice: '€270.49',
                    heroTag: 'tagThree',
                  ),
                  ShoeCard(
                    image: 'assets/shoe_2.png',
                    shoeName: 'Nike Air Max 97',
                    shoePrice: '€270.49',
                    heroTag: 'tagFour',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShoeCard extends StatelessWidget {
  String image, shoeName, shoePrice, heroTag;

  ShoeCard({
    required this.image,
    required this.shoeName,
    required this.shoePrice,
    required this.heroTag,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Description(
                      image: image,
                      heroTag: heroTag,
                      shoeName: shoeName,
                      shoePrice: shoePrice,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: 100.0 * 2.5,
          width: 40.0,
          decoration: BoxDecoration(
            color: secBgColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(),
              Column(
                children: [
                  Hero(
                    tag: heroTag,
                    child: Image.asset(
                      image,
                      height: 150,
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      shoeName,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      shoePrice,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class labelHeaderTexts extends StatelessWidget {
  String largeText, smallText;
  double fontSize;

  labelHeaderTexts({
    required this.fontSize,
    required this.largeText,
    required this.smallText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            largeText,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                smallText,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ],
      ),
    );
  }
}
