import 'package:flutter/material.dart';

import "package:properly_made_nft_market/decoration/MainPageItemsDecoration/MintDecoration.dart" as decoration;
class Mint extends StatefulWidget {
  const Mint({Key? key}) : super(key: key);

  @override
  _MintState createState() => _MintState();
}

class _MintState extends State<Mint> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SafeArea(
          child: Padding(
          padding: EdgeInsets.only(top:10.0),
          child: Center(
            child: Text(
              "Minting",
              style: decoration.mintTitle,

            ),
          ),
        ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child:
            Text("You can mint NFT's and create new collections from this page, all of these operations will cost money.",
            textAlign: TextAlign.center,
            style: decoration.mintDetails,
            ),
          ),
        ),
        Text(
          "Select a collection",
          style: decoration.collectionDropdownTitle
        ),

        //@TODO get COLLECTION names from backend VALUE CAN BE COLLLECTION OBJECT.
        Container(
          margin: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width * 3 / 4,

          child: DropdownButtonFormField(
            style: decoration.dropdownItemTextDecoration,
            borderRadius: BorderRadius.circular(20),
            dropdownColor: Colors.black,
            icon: Icon(Icons.category_outlined,color: Colors.white,),
            decoration: decoration.collectionContainer,
            onChanged: (dynamic change){
              print(change.toString());
            },
            items: [
              DropdownMenuItem(
                  value:1,
                  child:
              Text("hello world",style: decoration.dropdownItemTextDecoration,)
              ),

              DropdownMenuItem(
                  value:2,
                  child:
                  Text("lo world",style: decoration.dropdownItemTextDecoration,)
              ),



            ],
          ),
        ),
      ],
    );
  }
}
