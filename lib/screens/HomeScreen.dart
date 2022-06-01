// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:allcars/data/productdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../constants/card.dart';
import '../data/categorydata.dart';
import '../data/verticalscrolldata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenDisplay(),
    );
  }
}

class ScreenDisplay extends StatelessWidget {
  const ScreenDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 40,
            ),
            child: Row(
              children: [
                Text(
                  'RentAv',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Color.fromARGB(211, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                suffixIcon: Icon(Icons.search_outlined),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: Row(
              children: [
                Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Color.fromARGB(211, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Product_Data.map(
                (itemData) => Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Stack(
                    children: [
                      Container(
                        height: 290,
                        width: 270,
                        decoration: BoxDecoration(
                          color: itemData['color'],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(-7, 20),
                              blurRadius: 15,
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  itemData['image'],
                                  height: 150,
                                  width: 200,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    itemData['brand'],
                                    itemData['model'],
                                  ],
                                ),
                                Column(
                                  children: [
                                    itemData['amount'],
                                    itemData['timeline'],
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 50,
                          width: 140,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Order Now'),
                                Icon(Icons.arrow_forward),
                              ]),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          height: 35,
                          width: 140,
                          child: Column(
                            children: [
                              Text('Details'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ).toList(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: Row(
              children: [
                Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Color.fromARGB(165, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Category_Data.map(
                (category) => Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    // right: 10,
                  ),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: category['color'],
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 15,
                              spreadRadius: 5,
                              offset: Offset(-7, 20),
                              color: Colors.black12)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          category['name'],
                          Image.asset(
                            category['image'],
                            height: 100,
                            width: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          StaggeredGridView.countBuilder(
            crossAxisCount: 1,
            itemCount: ProductData.length,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            // itemCount: 2,
            itemBuilder: (BuildContext context, index) =>
                CardDisplay(itemData: ProductData[index]),
            staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),
          ),
        ],
      ),
    );
  }
}
