// main application will have 4 parts:
// Showcase
// Search
// Profile
// Mints
import 'package:flutter/material.dart';
import 'package:properly_made_nft_market/Decoration/AnimatedGradient.dart';
import "package:properly_made_nft_market/Decoration/MainApplicationDecoration.dart" as decoration;
import "package:properly_made_nft_market/pages/MainPageItems/Mint.dart";
import 'package:properly_made_nft_market/pages/MainPageItems/Search.dart';
import 'package:properly_made_nft_market/pages/MainPageItems/Showcase.dart';
import 'package:properly_made_nft_market/pages/MainPageItems/Profile.dart';


class MainPage extends StatefulWidget {
  const MainPage({ Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {

  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //This is the stupidest syntax i have seen in a long time.
        body:
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: Stack(
            children: [
              Positioned(
                  child: AnimatedGradient()
              ),
              Positioned(
                  child: SingleChildScrollView(
                    child: ((){
                      if(selectedIndex == 0)
                      {
                        return Showcase();
                      }
                      else if(selectedIndex == 1)
                      {
                        return ProfilePage();
                      }
                      else if(selectedIndex == 2)
                      {
                        return Search();
                      }
                      else if(selectedIndex == 3)
                      {
                        return Mint();
                      }


                    })(),
                  )

              )
            ],
          ),

        ),

        //routing within widget.
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: decoration.bottomNavBarIndexColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: decoration.bottomNavBarColor,
        unselectedItemColor: decoration.bottomNavBarUnselectedIndexColor,

        //on index change, set state as that index.
        onTap: (int x)=>{
          setState(()=>{
            selectedIndex = x,
          })
        },

        items: const [

          BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Profile",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.create),
              label: "Create",
          )
        ],
      ),
    );
  }
}

