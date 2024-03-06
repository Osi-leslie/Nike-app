import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class Description extends StatefulWidget {
  String image, heroTag, shoeName, shoePrice;

  Description(
      {required this.image,
      required this.heroTag,
      required this.shoeName,
      required this.shoePrice,
      Key? key})
      : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  int selectedSize = 0;

  List<String> shoeSizes = [
    '40',
    '41',
    '41,2',
    '42',
    '44',
    '44.3',
    '45',
    '45.2',
    '46',
    '46.2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black87,
              )),
        ),
        backgroundColor: secBgColor,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_outlined,
                  color: Colors.black87,
                )),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: secBgColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0)),
            ),
            child: Hero(
              tag: widget.heroTag,
              child: Image.asset(
                widget.image,
                height: 150,
                width: 200,
              ),
            ),
          ),

          const SizedBox(
            height: 16.0,
          ),

          Text(
            widget.shoeName,
            style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
          ),

          const SizedBox(
            height: 16.0,
          ),

          Text(
            widget.shoePrice,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
          ),

          const SizedBox(
            height: 32.0,
          ),

          labelHeaderTexts(
            fontSize: 16,
            largeText: 'Size',
            smallText: 'Size guide',
          ),
          const SizedBox(
            height: 8.0,
          ),

          //SIZES BOX
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Container(
              height: 80.0,
              width: double.infinity,
              color: Colors.transparent,
              child: ListView.builder(
                  itemCount: shoeSizes.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = i;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: selectedSize == i
                                ? Colors.black87
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Center(
                            child: Text(
                              shoeSizes[i],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: selectedSize == i
                                    ? Colors.white
                                    : Colors.black54,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),

          Expanded(child: Container()),

          //BUTTONS
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Row(
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.black12,
                      )),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_outline,
                        color: Colors.black54,
                      )),
                ),

                const SizedBox(
                  width: 16.0,
                ),

                //ADD TO CART BUTTON
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700),
          ),
          Text(
            smallText,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
