import 'package:flutter/material.dart';
import 'package:properly_made_nft_market/decoration/AnimatedGradient.dart';
import "package:properly_made_nft_market/decoration/DepositWithdrawDecoration.dart" as decoration;
import 'package:properly_made_nft_market/models/Nft.dart';
import 'package:provider/provider.dart';

import '../models/User.dart';
import '../providers/UserProvider.dart';
class DepositWithdraw extends StatefulWidget {
  const DepositWithdraw({Key? key}) : super(key: key);

  @override
  _DepositWithdrawState createState() => _DepositWithdrawState();
}

class _DepositWithdrawState extends State<DepositWithdraw> {
  NFT? dropDownValue;
  @override
  Widget build(BuildContext context) {

    final User? user = Provider
        .of<UserProvider>(context)
        .user;
    return Scaffold(

      body: Stack(
        children: [
          Positioned(child: AnimatedGradient()),
          Positioned(child:
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Deposit-Withdraw SU coin and NFT's",
                      style: decoration.depositWithdrawTitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //NEW IDEA

                  Padding(padding: EdgeInsets.only(top:20)),
                  GestureDetector(
                     onTap: ()=>{

                     },
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width:  MediaQuery.of(context).size.width * 3/4 ,
                      height: 50,
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
                        child: Text(

                          "Choose a SUNFT to withdraw..",
                          style: decoration.withdrawNFT,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                      ),
                  Padding(padding: EdgeInsets.all(8)),
                  GestureDetector(
                    onTap: ()=>{

                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width:  MediaQuery.of(context).size.width * 3/4 ,
                        height: 50,
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
                          child: Text(

                            "Choose a SUNFT to deposit..",
                            style: decoration.withdrawNFT,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Center(
                      child: Text("Your current market balance is: ", style: decoration.dropDownItemTextStyle,)),







                  /*
                  OLD IDEA
                  FutureBuilder(
                    future: user?.ownedNFTs,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return snapshot.hasData
                          ? Container(
                        height: 200,

                          )
                          : Container(
                        child: Center(
                          child: Text('Loading...'),
                        ),
                      );
                    },
                  ),
                  */
                ],
              ),
            )
          ),
          ),

        ],
      ),
    );
  }
}
