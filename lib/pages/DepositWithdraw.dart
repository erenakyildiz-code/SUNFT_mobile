import 'package:flutter/material.dart';
import 'package:properly_made_nft_market/decoration/AnimatedGradient.dart';
import "package:properly_made_nft_market/decoration/DepositWithdrawDecoration.dart" as decoration;
import 'package:properly_made_nft_market/models/Nft.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/credentials.dart';

import "../helpers/UserHelper.dart" as userHelper;
import '../models/User.dart';
import '../providers/UserProvider.dart';
import "package:properly_made_nft_market/helpers/marketHelper.dart" as marketHelper;
import "package:properly_made_nft_market/pages/DepositWithdrawNFT.dart";
class DepositWithdraw extends StatefulWidget {
  const DepositWithdraw({Key? key}) : super(key: key);

  @override
  _DepositWithdrawState createState() => _DepositWithdrawState();
}

class _DepositWithdrawState extends State<DepositWithdraw> {

  NFT? dropDownValue;

  TextEditingController withdrawAmount = TextEditingController();
  TextEditingController depositAmount = TextEditingController();
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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

                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => depositWithdrawNFT()
                           )
                       )
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
                      child: Text("Your wallets SUcoin balance is: ", style: decoration.dropDownItemTextStyle,)),

                  FutureBuilder<String>(
                      future: userHelper.query("balanceOf",[EthereumAddress.fromHex(user!.address)]),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return Text(snapshot.data!, style: decoration.dropDownItemTextStyle,);
                        }
                        else{
                          return const SizedBox( width:50, height: 50,child: Center(child:CircularProgressIndicator()));
                        }

                      }
                  ),
                  Container(
                    margin: const EdgeInsets.all(25),
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: decoration.loginFormField,
                    child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black87,
                        controller: depositAmount,
                        decoration: decoration.inputDecors
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=>{
                      print(depositAmount.text)
                    },
                    child: Container(

                      decoration: decoration.withdrawButton,
                      width: MediaQuery.of(context).size.width * 3/4,
                      height: 50,
                      child: Center(child: Text("Deposit SUcoins..",style: decoration.withdrawNFT,) ),
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(20)),

                  Center(
                      child: Text("Your Withdrawable SUcoin balance on the SUNFT market is : ", style: decoration.dropDownItemTextStyle,textAlign: TextAlign.center,)),
                  FutureBuilder<String>(
                      future: marketHelper.query("getMarketBalance",[]),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return Text(snapshot.data!, style: decoration.dropDownItemTextStyle,);
                        }
                        else{
                          return const SizedBox( width:50, height: 50,child: Center(child:CircularProgressIndicator()));
                        }

                      }
                  ),

                  Container(
                    margin: const EdgeInsets.all(25),
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: decoration.loginFormField,
                    child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black87,
                        controller: withdrawAmount,
                        decoration: decoration.inputDecors
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=>{
                      print(withdrawAmount.text)
                    },
                    child: Container(

                      decoration: decoration.withdrawButton,
                      width: MediaQuery.of(context).size.width * 3/4,
                      height: 50,
                      child: Center(child: Text("Withdraw SUcoins..",style: decoration.withdrawNFT,) ),
                    ),
                  ),



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
