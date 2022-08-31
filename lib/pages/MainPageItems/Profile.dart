import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:properly_made_nft_market/components/Containers/NFTCollectionContainer.dart';
import 'package:properly_made_nft_market/components/ListViewContainer.dart';
import "package:properly_made_nft_market/decoration/MainPageItemsDecoration/ProfileDecoration.dart" as decoration;
import 'package:properly_made_nft_market/models/Nft.dart';
import 'package:properly_made_nft_market/components/containers/NFTContainer.dart';
import 'package:properly_made_nft_market/models/NftCollection.dart';
import 'package:provider/provider.dart';
import '../../models/User.dart';
import '../../providers/UserProvider.dart';
import '../DepositWithdraw.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
   final List<Tab> tabs = const <Tab>[
     Tab(
       icon: Icon(Icons.person),
     ),
     Tab(
       icon: Icon(CupertinoIcons.heart_fill),
     ),
     Tab(
       icon: Icon(Icons.collections)
     )
// Tab(icon: Icon(Icons.bookmark))
   ];

   late TabController _tabController;
   late VoidCallback _handleTabChange;
   int _index = 0;

   @override
   void initState() {
     super.initState();
     _tabController = TabController(vsync: this, length: tabs.length);
     _handleTabChange = () {
       setState(() {
         _index = _tabController.index;
       });
     };
     _tabController.addListener(_handleTabChange);
   }

   @override
   void dispose() {
     _tabController.dispose();
     _tabController.removeListener(_handleTabChange);
     super.dispose();
   }





  @override
  Widget build(BuildContext context) {
    //@todo get this data from backend
    final User? user = Provider
        .of<UserProvider>(context)
        .user;
    final PageController pageController = PageController();
    if (user != null) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            //avatarbox
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 75),
              padding: const EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: decoration.profileHeaderDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: CircleAvatar(
                      //@TODO add image from backend here.
                      backgroundImage: NetworkImage(
                          user.profilePicture),
                      radius: 50,
                    ),
                  ),
                  Text(
                    user.address,
                    textAlign: TextAlign.center,
                    style: decoration.profileTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.username,
                    textAlign: TextAlign.center,
                    style: decoration.profileTextStyle,
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 16),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 7 / 10,
                    height: 2,
                    color: decoration.dividerColor,
                  ),
                  //balance Sheet
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: ()=>{
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DepositWithdraw()
                            )
                            )
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "User Balance",
                                    style: decoration.balanceSheetText,
                                    textAlign: TextAlign.start,
                                  ),
                                  const Icon(CupertinoIcons.bitcoin,
                                    color: Colors.white,)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //@TODO Get data from Blockchain
                                Text(
                                  "12312321123\$",
                                  style: decoration.balanceSheetText,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Likes",
                                style: decoration.balanceSheetText,
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 20.0),
                                  child: Icon(CupertinoIcons.heart_fill,
                                    color: Colors.white,)
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0),
                                child: Text(user.NFTLikes.toString(),
                                  style: decoration.balanceSheetText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //@TODO MOCK ITEM BUILDER, GET DATA FROM DB LATER.
            TabBar(tabs: tabs, controller: _tabController),
            if (_index == 0)
              ListViewContainer<NFT, NFTContainer>(parameterizedContainerConstructor: NFTContainer.parameterized, future: user.ownedNFTs),
            if (_index == 1)
              ListViewContainer<NFT, NFTContainer>(parameterizedContainerConstructor: NFTContainer.parameterized, future: user.likedNFTs),
            if(_index == 2)
              ListViewContainer<NFTCollection, NFTCollectionContainer> (parameterizedContainerConstructor:  NFTCollectionContainer.parameterized, future: user.watchlistedCollections)
    ]
        ));
          }
    else {
      return noUser(context);
  }
}
}
Widget noUser(context) {
  return (
      SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,

          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    "You must Log in to see this page.",
                    style: decoration.nonLoginErrorText,
                  ),
                ),

                Center(
                    child: GestureDetector(
                        onTap: () =>
                        {
                          Navigator.popAndPushNamed(context, "/Login"),
                        },
                        child: ClipRRect(

                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 3 / 4,
                            height: 100,

                            alignment: Alignment.bottomRight,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF596EED),
                                    Color(0xFFED5CAB),
                                    //Color(0xFF42A5F5),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: decoration.nonLoginButton,
                              ),
                            ),
                          ),

                        )
                    )
                )
              ]
          )
      )
  );
}