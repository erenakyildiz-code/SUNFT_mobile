import 'package:flutter/material.dart';
import 'package:properly_made_nft_market/Decoration/AnimatedGradient.dart';
import 'package:properly_made_nft_market/models/Nft.dart';
import 'package:properly_made_nft_market/Decoration/NFTPageDecoration.dart' as decoration;
import "package:properly_made_nft_market/components/transactionHistoryChart.dart";

import '../models/TransactionHistory.dart';
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
  @override
  Widget build(BuildContext context) {
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
                            //TransactionHistoryChart(history: snapshot.data ?? <TransactionHistory>[],),
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

                                    child: ListTile(
                                      title: Text(widget.NFTInfo.owner,style: decoration.listTileTitleStyle,),
                                      subtitle: Text("h"),
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        backgroundImage: NetworkImage("https://www.ekdergi.com/wp-content/uploads/2017/09/default-avatar.jpg"),
                                      ),
                                      trailing: Text("Owner"),



                            ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    width: MediaQuery.of(context).size.width ,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: decoration.listTileColor,
                                    ),
                                    child: ListTile(
                                      title: Text(widget.NFTInfo.owner,style: decoration.listTileTitleStyle,),
                                      subtitle: Text("h"),
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        backgroundImage: NetworkImage("https://www.ekdergi.com/wp-content/uploads/2017/09/default-avatar.jpg"),
                                      ),
                                      trailing: Text("Creator"),



                                    ),
                                  ),
                                ],
                              ),
                            //Buy / bid Button
                            if(widget.NFTInfo.marketStatus == 0)...[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(10),
                                decoration: decoration.nftMarketStatusBox,
                                child: Text("Buy this NFT for"),
                              ),
                            ]
                            else if(widget.NFTInfo.marketStatus == 1)...[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: decoration.nftMarketStatusBox,
                                margin: EdgeInsets.all(10),
                                child: Text("Bid on this NFT"),
                              ),
                            ]
                            else if(widget.NFTInfo.marketStatus == 2)...[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: decoration.nftMarketStatusBox,
                                  margin: EdgeInsets.all(10),
                                  child: Text("This NFT is currently not on market"),
                                ),
                              ]


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


