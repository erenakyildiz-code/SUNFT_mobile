import 'package:flutter/material.dart';
import 'package:properly_made_nft_market/components/Containers/NFTCollectionContainer.dart';
import 'package:properly_made_nft_market/decoration/AnimatedGradient.dart';
import "package:properly_made_nft_market/decoration/CategoryPageDecoration.dart" as decoration;
import 'package:properly_made_nft_market/models/Category.dart';
import 'package:properly_made_nft_market/models/NftCollection.dart';


import '../components/ListViewContainer.dart';
import '../helpers/NFTCollectionHelper.dart';
class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key,required this.category}) : super(key: key);
  final Category category;
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Positioned(child: AnimatedGradient()),
          Positioned(child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SafeArea(
                    child: Container(

                      margin: EdgeInsets.all(20),
                      decoration: decoration.categoryImageDecoration,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            Positioned(child: Image(image: NetworkImage(widget.category.backgroundPicture),height: 200,fit: BoxFit.fill,)),
                            Positioned(child: Center(child: CircleAvatar(backgroundImage: NetworkImage(widget.category.foregroundPicture),radius: 50,))),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(

                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(20),
                    decoration: decoration.categoryNameBoxDecoration,
                    child: Center(
                      child: Text(
                        widget.category.name + " Collections",
                        style: decoration.categoryImageTextStyle,
                      ),
                    ),

                  ),
                  ListViewContainer<NFTCollection, NFTCollectionContainer>(parameterizedContainerConstructor: NFTCollectionContainer.parameterized, future: getNFTsByCategory({"category":widget.category.name})),


                ],
              ),
            ),
          ))
        ],
      )
    );
  }
}
