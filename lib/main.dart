import 'package:drifter_test/dummy/shoe_carousel_data.dart';
import 'package:drifter_test/dummy/shoe_type.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: DriftUI(),
    );
  }
}

class DriftUI extends StatelessWidget {
  const DriftUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 18.0, bottom: 10),
                  child: Text(
                    'Shoes',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                // pills container
                SizedBox(
                  height: size.height * 0.05,
                  width: size.height * 1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    itemCount: shoeTypes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: _tagPill(shoeTypes[index]),
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: size.height * 0.04,
                ),

                // place holder for shoes
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return CarouselCard(data: data[index]);
                    },
                  ),
                ),

                SizedBox(
                  height: size.height * 0.05,
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    '244 OPTIONS',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                SizedBox(
                  height: size.height * 0.03,
                ),

                SizedBox(
                  height: size.height * 0.18,
                  width: size.width * 1,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    shrinkWrap: false,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ShoeOptionsWidget(data: data[index]);
                    },
                  ),
                ),

                SizedBox(
                  height: size.height * 0.02,
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_right_alt,
                      size: 35,
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

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Container(
        width: 290,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: data['card_color'],
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CarouselCardContent(data: data),
            Positioned(
              top: -10,
              left: -10,
              bottom: -10,
              child: Transform.rotate(
                angle: -math.pi / 3.58,
                child: Container(
                  height: 100,
                  width: 350,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/shoe_png_1.png'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CarouselCardContent extends StatelessWidget {
  const CarouselCardContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // shoename // rating

        Row(
          children: [
            // shoename
            Text(
              data["shoe_type"],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            // rating
          ],
        ),

        // shoe colors
        Text(
          data["colors"],
          style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w500),
        ),

        const SizedBox(
          height: 15,
        ),

        // alt price
        Text(
          data["price_alt"],
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),

        // line and alt_price
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 230,
              width: 0.6,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 5),
              child: Text(
                data["price_dollar"],
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ShoeOptionsWidget extends StatelessWidget {
  const ShoeOptionsWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        children: [
          // shoe image
          Container(
            width: 120,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/shoe_png_2.png'),
              ),
            ),
          ),

          const SizedBox(
            width: 15,
          ),

          // available colors and price
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // colors
              Text(
                data["colors"],
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),

              // prices
              Row(
                children: [
                  // alt price
                  Text(
                    data["price_alt"],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(width: 30),

                  // dollar price
                  Text(
                    data["price_dollar"],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget _tagPill(Map tag) {
  return UnconstrainedBox(
    child: Container(
      width: 120,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: tag["color"],
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // text
          Text(
            tag["name"],
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
