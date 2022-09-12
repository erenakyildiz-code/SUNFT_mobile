import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:properly_made_nft_market/decoration/DepositWithdrawNFTDecoration.dart" as decoration;
import 'package:provider/provider.dart';

import '../Decoration/AnimatedGradient.dart';
import '../components/Containers/NFTContainer.dart';
import '../components/ListViewContainer.dart';
import '../models/Nft.dart';
import '../models/User.dart';
import '../providers/UserProvider.dart';
class depositWithdrawNFT extends StatefulWidget {
  const depositWithdrawNFT({Key? key}) : super(key: key);

  @override
  _depositWithdrawNFTState createState() => _depositWithdrawNFTState();
}

class _depositWithdrawNFTState extends State<depositWithdrawNFT> {

  TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final User? user = Provider
        .of<UserProvider>(context)
        .user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: decoration.loginFormField,
          child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black87,
              controller: amount,
              decoration: decoration.inputDecors
          ),
        ),


      ),
      body: Stack(
        children: [
          Positioned(child: AnimatedGradient()),
          Positioned(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListViewContainer<NFT,NFTContainer>(
                    parameterizedContainerConstructor: NFTContainer.parameterized,
                    future: user?.ownedNFTs,direction: Axis.vertical,)
                ],


              ),
            ),
            )
        ],
      ),
    );
  }
}
