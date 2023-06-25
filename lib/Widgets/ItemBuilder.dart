import 'package:flutter/material.dart';
import 'package:solar_systemapp/Models/Model.dart';

import '../Const.dart';

Widget itemCard(Planet planet) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      planet.name,
                      style: TextStyle(
                          fontSize: 40,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Solar System',
                      style: TextStyle(
                          fontSize: 20,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Know More',
                          style: TextStyle(
                              fontSize: 16,
                              color: secondaryTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_right_sharp,
                          color: secondaryTextColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      Hero(
          tag: planet.iconImage,
          child: Image.asset(planet.iconImage))
    ],
  );
}
