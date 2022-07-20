import 'package:flutter/material.dart';

class Mint extends StatefulWidget {
  const Mint({Key? key}) : super(key: key);

  @override
  _MintState createState() => _MintState();
}

class _MintState extends State<Mint> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SafeArea(child: Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: Text(
            "Minting",
            textAlign: TextAlign.center,
            
          ),
        ),
        ),
      ],
    );
  }
}
