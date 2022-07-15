import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:properly_made_nft_market/Decoration/ContainerDecoration/NFTcontainerDecoration.dart" as decoration;

class NFTcontainer extends StatefulWidget {
  //@todo needs the nft data as arguments.
  const NFTcontainer({Key? key}) : super(key: key);

  @override
  _NFTcontainerState createState() => _NFTcontainerState();
}

class _NFTcontainerState extends State<NFTcontainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{
        //@todo route the user to nft Page. with the appropriate data.
        print("PRESSED THE NFT CONTAINER")
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 7/8,
        decoration: decoration.mainBoxDecoration,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(

              decoration: decoration.NFTimageContainerDecoration,

              //@TODO get image from backend, if null show loading
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top:Radius.circular(10)),
                  child: Image(
                    image: NetworkImage("https://play-lh.googleusercontent.com/IeNJWoKYx1waOhfWF6TiuSiWBLfqLb18lmZYXSgsH1fvb8v1IYiZr5aYWe0Gxu-pVZX3"),

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
                      //@TODO get data from backend
                      Text("name",
                      style: decoration.NFTnameDecoration,)
                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //@TODO get data from backend
                      Text("Collection",
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
                              Icon(
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
                              Icon(
                                CupertinoIcons.heart_fill,
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
