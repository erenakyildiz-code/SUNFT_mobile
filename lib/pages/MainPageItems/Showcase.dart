import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "package:properly_made_nft_market/decoration/MainPageItemsDecoration/ShowcaseDecoration.dart" as decoration;
import "package:properly_made_nft_market/components/Containers/NFTCollectionContainer.dart";
class Showcase extends StatefulWidget {
  const Showcase({Key? key}) : super(key: key);

  @override
  _ShowcaseState createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:  MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //categories
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Categories",
                style: decoration.collectionInfoDecoration,

              ),
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //@TODO get data from backend
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 1/3,
                      height: MediaQuery
                          .of(context)
                          .size
                          .width * 1/3,
                      decoration: decoration.categoryDecoration,
                    ),Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 1/3,
                      height: MediaQuery
                          .of(context)
                          .size
                          .width * 1/3,
                      decoration: decoration.categoryDecoration,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 1/3,
                      height: MediaQuery
                          .of(context)
                          .size
                          .width * 1/3,
                      decoration: decoration.categoryDecoration,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 1/3,
                      height: MediaQuery
                          .of(context)
                          .size
                          .width * 1/3,
                      decoration: decoration.categoryDecoration,
                    )



                  ],
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Trending Collections",
              style: decoration.collectionInfoDecoration,

              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  NFTCollectionContainer(),
                  NFTCollectionContainer(),
                  NFTCollectionContainer(),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
