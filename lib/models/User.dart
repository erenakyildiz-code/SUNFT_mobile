import 'dart:convert';
import 'package:properly_made_nft_market/models/Nft.dart';
import 'package:http/http.dart' as http;
import '../variables.dart';

class User {
  final String address;
  final String username;
  final String profilePicture;
  final String email;
  int NFTLikes;
  int collectionLikes;

  User({required this.address,required this.username,required this.profilePicture,
    required this.email, required this.NFTLikes,required this.collectionLikes});

  String get pk => address;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        address: json['uAddress'],
        username: json['username'],
        profilePicture: json['profilePicture'],
        email: json['email'],
        NFTLikes:  json['NFTLikes'],
        collectionLikes: json["collectionLikes"]
    );
  }

  @override
  String toString() => "User(address: $address, username: $username, profilePicture: $profilePicture, email: $email, NFTLikes: $NFTLikes, collectionLikes: $collectionLikes)";



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