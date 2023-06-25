import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_systemapp/Pages/SearchPage.dart';

import '../Const.dart';
import '../DataBase/dbHelper.dart';
import '../Pages/HomePage.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({super.key});

  @override
  State<MainFrame> createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  late int selectedPageIndex;
  late Widget currentpage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedPageIndex=0;
    currentpage=HomePage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          StreamProvider<QuerySnapshot?>.value(
            initialData: null,
            value: DBPlants,
            child: currentpage,
          ),

          //button menu
          Positioned(
            bottom: 0,
            left: 0,
            child:Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 10,left: 30,right: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30),bottom: Radius.zero),
                color: navigationColor
              ),
              child: Center(
                child: BottomNavigationBar(
                  backgroundColor: navigationColor,
                  selectedItemColor: activeIconColor,
                  unselectedItemColor: contentTextColor,
                  elevation: 0,
                  currentIndex: selectedPageIndex,
                  iconSize: 21,
                  items: const [
                    BottomNavigationBarItem(
                      label: '',
                      icon: ImageIcon(AssetImage('assets/menu_icon.png')),
                      ),
                    BottomNavigationBarItem(
                      label: '',
                      icon: ImageIcon(AssetImage('assets/search_icon.png'))
                      ),
                    BottomNavigationBarItem(label: '',
                    icon: ImageIcon(AssetImage('assets/profile_icon.png'))
                    ),
                  ],
                  onTap: (value) {
                    setState(() {
                      selectedPageIndex=value;
                      if(value==0){
                        currentpage=HomePage();
                      }
                      if(value==1){
                        currentpage=SearchPage();
                      }
                    });
                  },
                ),
              )
            ),
          )
        ],
      ),

    );
  }
}