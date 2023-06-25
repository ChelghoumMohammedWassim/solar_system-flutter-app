import 'package:flutter/material.dart';

import '../Const.dart';
import '../Models/Model.dart';

// ignore: must_be_immutable
class DetailsFrame extends StatefulWidget {
  Planet planet;
  DetailsFrame({super.key,required this.planet});

  @override
  State<DetailsFrame> createState() => _DetailsFrameState();
}

class _DetailsFrameState extends State<DetailsFrame> {
  @override
  Widget build(BuildContext context) {
    Planet planet=widget.planet;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: -70,
            top: -70,
            child: Hero(
              tag: planet.iconImage,
              child: Image.asset(planet.iconImage)
              ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 20,bottom: 20,top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: SizedBox(
                      height: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      planet.name,
                      style: TextStyle(
                        fontSize: 50,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),                  
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'SolarSystem',
                      style: TextStyle(
                        fontSize: 30,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                   const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Divider(
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      planet.description,
                      overflow: TextOverflow.clip,
                      maxLines: 7,
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black45,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 25,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 160,
                    child:  ListView.builder(
                      itemCount: planet.images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                planet.images[index],
                                fit: BoxFit.cover,
                              )),
                        );
                      }),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 20,
            child: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new,size: 18,),
            ),
          ),
        ],
      ),
    );
  }
}