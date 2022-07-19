import 'package:flutter/material.dart';
import "package:properly_made_nft_market/decoration/ContainerDecoration/NFTCollectionContainerDecoration.dart" as decoration;
class NFTCollectionContainer extends StatefulWidget {
  const NFTCollectionContainer({Key? key}) : super(key: key);

  @override
  _NFTCollectionContainerState createState() => _NFTCollectionContainerState();
}

class _NFTCollectionContainerState extends State<NFTCollectionContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{
      //@TODO route the user to collection page

      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery
            .of(context)
            .size
            .width * 3/4,
        height: MediaQuery
            .of(context)
            .size
            .width * 3/4,
        decoration: decoration.containerBoxDecoration,

      ),
    );
  }
}
