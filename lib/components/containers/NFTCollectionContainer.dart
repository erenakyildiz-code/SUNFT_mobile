import 'package:flutter/material.dart';
import "package:properly_made_nft_market/decoration/ContainerDecoration/NFTCollectionContainerDecoration.dart" as decoration;
import 'package:properly_made_nft_market/models/NftCollection.dart';
class NFTCollectionContainer extends StatefulWidget {
  const NFTCollectionContainer({Key? key,required this.collection}) : super(key: key);
  final NFTCollection collection;
  const NFTCollectionContainer.parameterized(this.collection, Key? key): super(key: key);
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
        child: FittedBox(
          fit: BoxFit.cover,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image(
              
              image: NetworkImage(widget.collection.collectionImage),
            ),
          ),
        ),

      ),
    );
  }
}
