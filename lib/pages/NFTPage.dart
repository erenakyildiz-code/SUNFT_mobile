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
        backgroundColor: Colors.transparent,
      ),
        body: StreamBuilder<List<TransactionHistory>>(
          stream: widget.NFTInfo.transactionHistory,
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
                              child: Row(
                                children: [
                                  Text(
                                    "Address: ",
                                    style: decoration.addressOfNftText,
                                  ),
                                  Text(
                                    widget.NFTInfo.address,
                                    style: decoration.addressOfNftText,
                                  ),
                                ],
                              ),
                            ),



                            Container(
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width * 3/4,
                              height: 3,
                              margin: EdgeInsets.symmetric(vertical: 20),
                            ),
                            //price history container.
                            TransactionHistoryChart(),
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


