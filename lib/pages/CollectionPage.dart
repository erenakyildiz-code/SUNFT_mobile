import 'package:flutter/material.dart';
import 'package:properly_made_nft_market/models/NftCollection.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key, required this.collectionInfo}) : super(key: key);
  final NFTCollection collectionInfo;
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(image: NetworkImage(widget.collectionInfo.collectionImage))


        ],
      ),
    );
  }
}
