import 'dart:convert';

import 'package:properly_made_nft_market/models/Nft.dart';
import 'package:http/http.dart' as http;

import '../variables.dart';

class User {
  final String address;
  final String username;
  final String? profilePicture;
  final String email;
  final int totalNFTLikes;
  final int totalCollectionLikes;

  User({required this.address,required this.username,required this.profilePicture,required this.email, required this.totalNFTLikes,required this.totalCollectionLikes});

  String get pk => address;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        address: json['uAddress'],
        username: json['username'],
        profilePicture: json['profilePicture'],
        email: json['email'],
        totalNFTLikes:  json['totalNFTLikes'],
        totalCollectionLikes: json["totalCollectionLikes"]
    );
  }

  @override
  String toString() => "User(address: $address, username: $username, profilePicture: $profilePicture, email: $email, totalNFTLikes: $totalNFTLikes, totalCollectionLikes: $totalCollectionLikes)";



  Stream<List<NFT>> get ownedNFTs async* {
    List<NFT> ownedNFTs = <NFT>[];
    while (true) {
      final request = http.Request("GET", Uri.parse("$APIPath/nfts/?currentOwner=$pk"));
      request.headers.addAll(<String, String>{
        "Accept": "application/json",
        "Content-Type": "application/json",
      });
      final response = await request.send();
      final List JSONList = json.decode(await response.stream.bytesToString());
      List<NFT> newData = JSONList.map((item) => NFT.fromJson(item)).toList();
      if (newData.length != ownedNFTs.length || !newData.every((element) => ownedNFTs.contains(element))) {
        ownedNFTs = newData;
        yield ownedNFTs;
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }


}