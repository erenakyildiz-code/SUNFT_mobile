import 'package:flutter/material.dart';
import 'package:properly_made_nft_market/Decoration/AnimatedGradient.dart';
import 'package:properly_made_nft_market/decoration/NFTPageDecoration.dart';
import 'package:properly_made_nft_market/models/Nft.dart';
import 'package:properly_made_nft_market/Decoration/NFTPageDecoration.dart' as decoration;
import "package:properly_made_nft_market/components/transactionHistoryChart.dart";
import 'package:properly_made_nft_market/services/AuthService.dart';
import 'package:provider/provider.dart';

import '../helpers/UserHelper.dart';
import '../models/TransactionHistory.dart';
import '../models/User.dart';
import '../providers/UserProvider.dart';
/*
CONDITIONS:
  1- ON SALE (means item is on market also),
  if user is not owner: can buy, else: can not buy.

  2- ON AUCTION (same as above)
  if user is not owner and is not the highest bidder: can bid
  else if user is not owner and is highest bidder: can not bid (show the user has highest bid as reason)
  else: can not bid (show the user is owner as reason)

  3- NOT ON SALE (same as above)
  if user is owner: can start auction or regular sale
  else:user can see that item is not for sale.

  4- NOT ON MARKET
  if user is owner: can deposit item
  else: user sees the item is not on market
 */
class NFTPage extends StatefulWidget {
  const NFTPage({Key? key, required this.NFTInfo}) : super(key: key);
  final NFT NFTInfo;

  @override
  _NFTPageState createState() => _NFTPageState();
}

class _NFTPageState extends State<NFTPage> {
  GestureDetector paymentContainer(int marketStatus, bool isOwner){
    String textOfBox = "";
    bool isActive = true;
    if(marketStatus == 0){
      textOfBox = "This item is not on market";
      isActive = false;
    }
    else if (marketStatus == 1){
      if(isOwner){
        textOfBox = "Sell/Auction off this NFT";
      }
      else{
        textOfBox = "This item is not for sale";
        isActive = false;

      }
    }
    else if (marketStatus == 2){
      if(isOwner){
        textOfBox = "NFT is currently on sale";
        isActive = false;

      }
      else{
        textOfBox = "Buy this NFT";
      }
    }
    else if (marketStatus == 3){
      if(isOwner){
        textOfBox = "NFT is currently on sale";
        isActive = false;

      }
      else{
        textOfBox = "Bid on this NFT";
      }
    }


    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 3/4,
        height: 36,
        margin: EdgeInsets.all(10),
        decoration: nftMarketStatusBox,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.paid_outlined,color: (isActive ? Colors.white : Colors.grey),),
              ),
            ),
            Center(child: Text(textOfBox, style: decoration.marketStatusTextStyle(isActive),)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User? user = Provider
        .of<UserProvider>(context)
        .user;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.NFTInfo.name),
        backgroundColor: decoration.appBarColor,
      ),
        body: FutureBuilder<List<TransactionHistory>>(
          future: widget.NFTInfo.transactionHistory,
          builder: (context, snapshot) {
            // list of transaction histories is visible here
            print(snapshot.data);
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,

              child: Stack(
                children: [
                  Positioned(
                      child: AnimatedGradient()
                  ),
                  Positioned(
                      child:
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: NetworkImage(widget.NFTInfo.dataLink)
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,top:8.0),
                        child: Row(
                          children: [
                            Text(
                              "Unique ID: ",
                              style: decoration.addressBoxTextDecoration,
                            ),
                            Text(
                              widget.NFTInfo.nID.toString(),
                              style: decoration.addressBoxTextDecoration,
                            ),
                          ],
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0,top:8.0),
                          child: Text(
                            "Address: ${widget.NFTInfo.address}",
                            style: decoration.addressOfNftText,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),



                            Container(
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width * 3/4,
                              height: 3,
                              margin: EdgeInsets.symmetric(vertical: 20),
                            ),
                            paymentContainer(widget.NFTInfo.marketStatus,widget.NFTInfo.owner == user?.address),

                            //price history container.
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 10,bottom: 20),
                              child: Text(
                                "Transaction History",
                                textAlign: TextAlign.start,
                                style: decoration.addressOfNftText,
                              ),
                            ),
                            //LAGGY
                            TransactionHistoryChart(history: snapshot.data ?? <TransactionHistory>[],),
                            //get owner data

                            SizedBox(height: 10,),

                              //@TODO backend data here.
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width ,
                                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: decoration.listTileColor,
                                    ),

                                    child: FutureBuilder<User?>(
                                      future: getUser(address: widget.NFTInfo.owner),
                                      builder: (context, snapshot) {
                                        if(snapshot.hasData){
                                          return ListTile(
                                            title: Text(snapshot.data!.username,style: decoration.listTileTitleStyle,),
                                            subtitle: Text( widget.NFTInfo.owner),
                                            leading: CircleAvatar(
                                              backgroundColor: Colors.black,
                                              backgroundImage: NetworkImage(snapshot.data!.profilePicture),
                                            ),
                                            trailing: Text("Owner"),



                                          );
                                        }
                                        else{
                                          return const SizedBox( width:50, height: 50,child: Center(child:CircularProgressIndicator()));
                                        }

                                      }
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    width: MediaQuery.of(context).size.width ,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: decoration.listTileColor,
                                    ),
                                    child: FutureBuilder<User?>(
                                        future: getUser(address: widget.NFTInfo.creator),
                                        builder: (context, snapshot) {
                                          if(snapshot.hasData){
                                            return ListTile(
                                              title: Text(snapshot.data!.username,style: decoration.listTileTitleStyle,),
                                              subtitle: Text(widget.NFTInfo.creator),
                                              leading: CircleAvatar(
                                                backgroundColor: Colors.black,
                                                backgroundImage: NetworkImage(snapshot.data!.profilePicture),
                                              ),
                                              trailing: Text("Creator"),



                                            );
                                          }
                                          else{
                                            return const SizedBox( width:50, height: 50,child: Center(child:CircularProgressIndicator()));
                                          }

                                        }
                                    ),
                                  ),
                                ],
                              ),
                            //Buy / bid Button



                          ],
                        ),
                      ),
                    )
                  )

                ],
              ),

            );
          }
        ),

    );
  }
}


