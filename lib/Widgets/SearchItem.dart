import 'package:flutter/material.dart';
import 'package:solar_systemapp/Const.dart';

import '../Models/Model.dart';

Widget searchItem(Planet planet){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white54,
      borderRadius: BorderRadius.circular(15)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: planet.iconImage,
          child: Image.asset(planet.iconImage,height: 40,width: 40,)
          ),
        SizedBox(width: 30,),
        Text(planet.name,overflow: TextOverflow.clip,maxLines: 1,style: TextStyle(color:primaryTextColor,fontWeight: FontWeight.w500),)
      ],
    ),
  );
}