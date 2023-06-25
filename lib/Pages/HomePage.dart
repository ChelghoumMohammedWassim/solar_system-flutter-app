import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_systemapp/Const.dart';
import 'package:solar_systemapp/Frames/DetailsFrame.dart';
import 'package:solar_systemapp/Widgets/ItemBuilder.dart';

import '../DataBase/dbHelper.dart';
import '../Loading.dart';
import '../Models/Model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //read streamed Data
    final snapshot=Provider.of<QuerySnapshot?>(context);

    //convert data from maps to Planet Object and add it to list
    List<Planet> planetsList=[];
    if(snapshot!=null){
      planetsList=SnapshotToList(snapshot);
    }
    return Scaffold(
      body: Column(
        children: [

          //Decoration
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.3,0.7],
                colors: [
                  gradientStartColor,
                  gradientEndColor
                ]
              )
            ),

            //loading
            child: snapshot==null? const Loading():
            
            //Header
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Container(
                          margin: const EdgeInsets.only(top: 20,bottom: 3),
                          child: Text('Explore',style: TextStyle(fontSize: 40,color: titleTextColor, fontWeight: FontWeight.w700),),
                        ),

                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: Text('Solar System',style: TextStyle(fontSize: 18,color: contentTextColor, fontWeight: FontWeight.w300),),
                        )
                  
                      ],
                    ),
                  ),

                  //main Content
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),              
                            height: MediaQuery.of(context).size.height*0.65,
                            width: MediaQuery.of(context).size.width,
                            child:Swiper(
                              itemCount: planetsList.length,
                              itemWidth: MediaQuery.of(context).size.width*0.8,
                              layout: SwiperLayout.STACK,
                              pagination: SwiperPagination(
                                builder: DotSwiperPaginationBuilder(
                                  activeColor: titleTextColor,
                                  color: Colors.grey[300],
                                  activeSize: 12
                                )
                              ),
                              itemBuilder: (context, index) {
                                //create Visualization for each item
                                return InkWell(
                                  child: itemCard(planetsList[index]),
                                  onTap: (){
                                    //push  details frame
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) {
                                          return DetailsFrame(planet: planetsList[index],);
                                        },
                                      )
                                    );
                                  },
                                  );
                              },

                            )
                          )
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            )
            ,
          ),
        ],
      ),

    );
  }
}