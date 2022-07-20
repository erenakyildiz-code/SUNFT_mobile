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
        )
      ],
    );
  }
}
