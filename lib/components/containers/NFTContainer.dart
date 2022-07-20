import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:properly_made_nft_market/Decoration/ContainerDecoration/NFTcontainerDecoration.dart" as decoration;
import 'package:provider/provider.dart';


import '../../models/Nft.dart';
import '../../models/User.dart';
import '../../pages/NFTPage.dart';
import '../../providers/UserProvider.dart';

class NFTContainer extends StatefulWidget {
  final NFT nft;
  const NFTContainer({Key? key, required this.nft}) : super(key: key);
  const NFTContainer.parameterized(this.nft, Key? key): super(key: key);

  @override
  _NFTContainerState createState() => _NFTContainerState();
}

class _NFTContainerState extends State<NFTContainer> {
  @override
  Widget build(BuildContext context) {
    final User? user = Provider
        .of<UserProvider>(context)
        .user;
    return GestureDetector(
      onTap: () {
        //@todo route the user to nft Page. with the appropriate data.
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NFTPage(NFTInfo: widget.nft))
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 7/8,
        decoration: decoration.mainBoxDecoration,
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(

              decoration: decoration.NFTimageContainerDecoration,

              //@TODO get image from backend, if null show loading
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top:Radius.circular(10)),
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(widget.nft.dataLink),

              ),
                )
            ),
            Container(
              decoration: decoration.bottomInfoDecoration,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.nft.name,
                      style: decoration.NFTnameDecoration,)
                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //@TODO get data from backend
                      Text(widget.nft.collectionName,
                      style: decoration.NFTcollectionDecoration,)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Column(
                            children: [
                              const Icon(
                                CupertinoIcons.bitcoin,
                                color: Colors.white,
                              ),
                              Text(
                                //@TODO get data from backend
                                "12344123123",
                                style: decoration.latestPriceDecoration,
                              )
                            ],
                          ),
                        ),
                            Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap:()async {
                                  print("Supossed to like");
                                  print(user);
                                  await user?.likeNFT(widget.nft.pk);
                                },
                                child: Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                //@TODO get data from backend
                                widget.nft.likeCount.toString(),
                                style: decoration.latestPriceDecoration,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}