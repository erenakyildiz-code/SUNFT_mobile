import 'dart:io';

import 'package:flutter/material.dart';
import "package:properly_made_nft_market/decoration/MainPageItemsDecoration/MintDecoration.dart" as decoration;
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../CreateCollection.dart';

class Mint extends StatefulWidget {
  const Mint({Key? key}) : super(key: key);

  @override
  _MintState createState() => _MintState();
}

class _MintState extends State<Mint> {
  File? imagePath;
  TextEditingController NFTNameControl = new TextEditingController();
  TextEditingController NFTDescriptionControl = new TextEditingController();
  TextEditingController NFTIdControl = new TextEditingController();


  Future pickImage(type) async{
    final image = await ImagePicker().pickImage(source: type);
    if(image == null) return;
    setState(() {
      imagePath = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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

        //@TODO get COLLECTION names from backend VALUE CAN BE COLLLECTION OBJECT.
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          width: MediaQuery.of(context).size.width * 3 / 4,


          child: Center(
            child: DropdownButtonFormField(

              isDense: true,
              elevation: 0,
              style: decoration.dropdownItemTextDecoration,
              borderRadius: BorderRadius.circular(20),
              dropdownColor: Colors.black,
              decoration: decoration.collectionContainer("Collection"),
              onChanged: (dynamic change){


                if(change == "NEW"){
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateCollectionPage()
                      )
                  );


                }
                else {
                  print(change.toString());

                }



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
                DropdownMenuItem(
                    value:"NEW",

                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(child: Icon(Icons.add,color: Colors.white,size: 24,)),
                      ],
                    )
                ),



              ],
            ),
          ),
        ),
        //NFT NAME FIELD
        Container(
          margin: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width * 3 / 4,

          child: TextFormField(
            style: decoration.dropdownItemTextDecoration,

            decoration:  decoration.collectionContainer("Name of NFT"),
            controller: NFTNameControl,

          )
        ),
        Container(
            margin: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width * 3 / 4,

            child: TextFormField(
              style: decoration.dropdownItemTextDecoration,
              decoration:  decoration.collectionContainer("Description of NFT"),
              controller: NFTDescriptionControl,


            )
        ),
        Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width * 3 / 4,

            child: TextFormField(
              style: decoration.dropdownItemTextDecoration,

              decoration:  decoration.collectionContainer("ID of NFT"),
              controller: NFTIdControl,

            )
        ),
        (imagePath != null) ? Container(width: 100,height: 100,child: Image.file(imagePath!)) : Text("nothing selected",style:decoration.nothingSelectedDecoration,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            GestureDetector(
              onTap: ()=>{
                pickImage(ImageSource.gallery)

              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 1 / 4,
                height: 50,

                decoration: decoration.imagePickerDecoration,
                child: Icon(Icons.image,color: Colors.white,),
              ),
            ),
            GestureDetector(
              onTap: ()=>{
                pickImage(ImageSource.camera)
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 1 / 4,
                height: 50,
                decoration: decoration.imagePickerDecoration,
                child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
              ),
            ),

          ]

        ),

            ClipRRect(

    child: GestureDetector(
      onTap: ()=> launch("https://metamask.app.link/dapp/10.0.2.2:3000/Mobile/Mint_NFT_existing_collection?"),
      child: Container(

        margin: EdgeInsets.all(10),
      width:  MediaQuery.of(context).size.width * 1/2 ,
      height: 50,
      alignment: Alignment.bottomRight,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      gradient: LinearGradient(
      colors: <Color>[
      Color(0xFF596EED),
      Color(0xFFED5CAB),
      //Color(0xFF42A5F5),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight
      ),
      ),
      child: Center(
      child:  Text(
      "Mint this NFT",
      style: decoration.mintButtonTextStyle,
      )
      ),
      ),
    ),
    ),
        Center(
          child: Text(
            "You must choose the option to launch this url on Metamask Browser",
            style: decoration.dropdownItemTextDecoration,
            textAlign: TextAlign.center,
          ),
        )

      ],
    );
  }
}
