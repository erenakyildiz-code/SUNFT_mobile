import 'package:flutter/material.dart';
import "package:properly_made_nft_market/decoration/MainPageItemsDecoration/ShowcaseDecoration.dart" as decoration;
import 'package:properly_made_nft_market/models/Category.dart';


class CategoryContainer extends StatelessWidget {
  final Category category;
  const CategoryContainer({Key? key,required this.category}) : super(key: key);
  const CategoryContainer.parameterized(this.category, Key? key): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery
          .of(context)
          .size
          .width * 1/3,
      height: MediaQuery
          .of(context)
          .size
          .width * 1/3,
      decoration: decoration.categoryDecoration,
      child: ClipRRect(
            borderRadius: const BorderRadius.all(
                Radius.circular(20)
            ),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image(
              image: NetworkImage(category.foregroundPicture),
            ),
          )
      ),
    );
  }
}
