// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CardDisplay extends StatelessWidget {
  final dynamic itemData;
  const CardDisplay({Key? key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        color: itemData['color'],
        margin: EdgeInsets.all(10),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      itemData['image'],
                      height: 150,
                      width: 150,
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
                        itemData['brand'],
                        itemData['model'],
                      ],
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 60,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Order Now'),
                    Icon(Icons.arrow_right_alt_outlined),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 40,
                width: 180,
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
    );
  }
}
