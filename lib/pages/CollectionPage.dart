import 'package:flutter/material.dart';
import 'package:properly_made_nft_market/components/Containers/NFTContainer.dart';
import 'package:properly_made_nft_market/helpers/NFTHelper.dart';
import 'package:properly_made_nft_market/helpers/UserHelper.dart';
import 'package:properly_made_nft_market/models/NftCollection.dart';
import 'package:properly_made_nft_market/decoration/AnimatedGradient.dart';
import 'package:properly_made_nft_market/decoration/CollectionPageDecoration.dart' as decoration;
import 'package:provider/provider.dart';

import '../components/ListViewContainer.dart';
import '../models/Nft.dart';
import '../models/User.dart';
import '../providers/UserProvider.dart';
class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key, required this.collectionInfo}) : super(key: key);
  final NFTCollection collectionInfo;
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  bool expandPressed = false;

  @override
  Widget build(BuildContext context) {
    final User? user = Provider
        .of<UserProvider>(context)
        .user;
    return Scaffold(
      body:
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(

            children: [
              Positioned(
                child: AnimatedGradient(),
              ),
              Positioned(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(

                    children: [
                      SafeArea(
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child:
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                             child:  Image(image: NetworkImage(widget.collectionInfo.collectionImage)),
                            )


                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(20),
                        decoration: decoration.collectionNameBoxDecoration,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.collectionInfo.name,
                                  style: decoration.collectionNameTextStyle,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Watchlist: " + widget.collectionInfo.numLikes.toString(),
                                  style: decoration.collectionNameTextStyle,
                                ),
                                Text(
                                  "Likes: " + widget.collectionInfo.NFTLikes.toString(),
                                  style: decoration.collectionNameTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(

                        child: Container(
                          width: MediaQuery.of(context).size.width * 3 /4 ,
                          height: 30,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text("Watchlist this collection", style: decoration.collectionDescriptionTextStyle,),
                          decoration: decoration.collectionNameBoxDecoration,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: widget.collectionInfo.description != null
                            ?
                        (widget.collectionInfo.description!.length <= 100 || expandPressed) ? Text(
                          "Description: \n\n" + widget.collectionInfo.description!,
                          style: decoration.collectionDescriptionTextStyle,
                        )
                        :
                        GestureDetector(
                          child: Text("Description: \n\n" + widget.collectionInfo.description!.substring(0,100)+ "...",
                          style: decoration.collectionDescriptionTextStyle,)
                            ,
                          onTap: ()=> setState(() {
                            expandPressed = true;
                          })
                        )




                            :
                        Text("No description provided by owner",
                          style: decoration.collectionDescriptionTextStyle,

                        ),
                      ),
                      Container(
                        decoration: decoration.collectionOwnerBoxDecoration,
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Created by: " + widget.collectionInfo.owner,
                              style: decoration.collectionOwnerTextStyle,
                            ),
                            FutureBuilder<User?>(
                              future: getUser(username: widget.collectionInfo.owner),
                                builder: (context, snapshot) {
                                  if(snapshot.hasData){
                                    return CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot.data!.profilePicture),
                                    );
                                  }
                                  else{
                                    return CircleAvatar();
                                  }


                              }
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left:20),
                        width:  MediaQuery.of(context).size.width,
                          child: Text("Items in this collection:" , style: decoration.collectionItemsTextStyle, )),
                      ListViewContainer<NFT,NFTContainer>(
                        parameterizedContainerConstructor: NFTContainer.parameterized,
                        future: getNFTsByCollection({"collection":widget.collectionInfo.address}),
                  ),


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
