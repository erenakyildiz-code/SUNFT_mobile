import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:properly_made_nft_market/Decoration/MainPageItemsDecoration/ProfileDecoration.dart" as decoration;
import 'package:properly_made_nft_market/pages/Containers/NFTcontainer.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override


  Widget build(BuildContext context) {
    //@todo get this data from backend
    ScrollController Scroller = new ScrollController();
    var entries = ["hello world","hello other world","hellooooo"];
    if(true){
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: Scroller,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            //avatarbox
            Container(
              margin: const EdgeInsets.only(left: 10, right:10,top: 75),
              padding: const EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: decoration.profileHeaderDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                    child: CircleAvatar(
                      //@TODO add image from backend here.
                      backgroundImage: NetworkImage("https://ia801703.us.archive.org/6/items/twitter-default-pfp/e.png"),

                      radius: 50,

                    ),
                  ),
                  Text(
                    "0xDDcbd1913CA06fC43A32c5eFB82748301334bB7f",
                    textAlign: TextAlign.center,
                    style: decoration.profileTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Erenakyildiz",
                    textAlign: TextAlign.center,
                    style: decoration.profileTextStyle,
                  ),

                  Container(
                    margin: EdgeInsets.only(top:16,bottom: 16),
                    width: MediaQuery.of(context).size.width * 7/10,
                    height: 2,
                    color: decoration.dividerColor,
                  ),
                  //balance Sheet
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "User Balance",
                                  style: decoration.balanceSheetText,
                                  textAlign: TextAlign.start,
                                ),
                                Icon(CupertinoIcons.bitcoin,color: Colors.white,)

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //@TODO Get data from Blockchain
                                Text(
                                  "12312321123\$",
                                  style: decoration.balanceSheetText,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Likes",
                                style: decoration.balanceSheetText,

                              ),
                              const Padding(
                                  padding: EdgeInsets.only(left: 5,right: 20.0),
                                  child: Icon(CupertinoIcons.heart_fill,color: Colors.white,)

                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                //@TODO Get data from db
                                child: Text("123545",
                                  style: decoration.balanceSheetText,

                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),


                ],
              ),

            ),

            //@TODO MOCK ITEM BUILDER, GET DATA FROM DB LATER.
            ListView.builder(

                controller: Scroller,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return NFTcontainer(

                  );
            }
            )


          ],

        ),
      );
    }

    //non login
    else{
      return(
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 30),
              child: Text(
                "You must Log in to see this page.",
                style: decoration.nonLoginErrorText,
                ),
              ),

              Center(
                child: GestureDetector(
                  onTap: ()=>{
                    Navigator.popAndPushNamed(context, "/Login"),
                  },
                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width:  MediaQuery.of(context).size.width * 3/4 ,
                      height: 100,

                      alignment: Alignment.bottomRight,
                      decoration: const BoxDecoration(
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

                          "Login",
                          textAlign: TextAlign.center,
                          style: decoration.nonLoginButton,
                        ),
                      ),
                    ),





                  ),
                ),
              ),
            ],
          ),
        )

      );
    }

  }
}
