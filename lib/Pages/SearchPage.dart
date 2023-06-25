import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_systemapp/Widgets/SearchItem.dart';
import '../Const.dart';
import '../DataBase/dbHelper.dart';
import '../Frames/DetailsFrame.dart';
import '../Loading.dart';
import '../Models/Model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String input;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    input='';
  }

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
      body: SafeArea(
        child:           //Decoration
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
                    padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:  TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search Here',
                        suffixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          input=value;
                        });
                      },
                    ),
                  ),
                  ),

                  //main Content
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 60),
                      child: ListView.builder(
                        itemCount: planetsList.length,
                        itemBuilder: (context, index) {
                          if(input.isEmpty){
                            return InkWell(
                              child: searchItem(planetsList[index]),
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
                          }
                          if(planetsList[index].name.toLowerCase().startsWith(input.toLowerCase()) || planetsList[index].description.toString().contains(input.toLowerCase())){
                            return InkWell(
                              child: searchItem(planetsList[index]),
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
                          }
                          return Container();
                        },

                      ),
                    ),
                  ),
                ],
              ),
            )
            ,
          ),
      ),
    );
  }
}