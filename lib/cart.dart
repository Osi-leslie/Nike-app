import 'package:flutter/material.dart';

import 'color.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
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
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.black87,
          ),
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
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black87,
                )),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //My BAG CONTAINER
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Text(
              'My Bag',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),

          //CART LIST
          CartCard(
            image: 'assets/shoe_1.png',
            shoeName: 'Nike Air Max 270React',
            shoePrice: '€270.49',
          ),

          CartCard(
            image: 'assets/shoe_2.png',
            shoeName: 'Nike Air Max 97',
            shoePrice: '€299.00',
          ),

          CartCard(
            image: 'assets/shoe_1.png',
            shoeName: 'Nike Air Max 270React',
            shoePrice: '€270.49',
          ),

          const SizedBox(
            height: 24.0,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 24.0, color: Colors.black26),
                ),
                Text(
                  '€839.98',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          Expanded(child: Container()),

          //CHECKOUT BUTTON
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Container(
              height: 60.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(90.0),
              ),
              child: const Center(
                child: Text(
                  'Checkout',
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
    );
  }
}

class CartCard extends StatelessWidget {
  String image, shoeName, shoePrice;

  CartCard({
    required this.image,
    required this.shoeName,
    required this.shoePrice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Container(
        height: 90.0,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Container(
                height: 90.0,
                width: 140.0,
                decoration: BoxDecoration(
                  color: secBgColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Image.asset(
                    image,
                    height: 60,
                    width: 100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shoeName,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    shoePrice,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Text('x1'),
          ],
        ),
      ),
    );
  }
}
