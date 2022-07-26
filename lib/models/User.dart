import 'dart:async';
import 'package:properly_made_nft_market/models/Nft.dart';
import 'package:properly_made_nft_market/models/NftCollection.dart';
import '../backend/requests.dart';

class User {
  final String address;
  final String username;
  final String profilePicture;
  final String email;
  int NFTLikes;
  int collectionLikes;

  User(
      {required this.address,
      required this.username,
      required this.profilePicture,
      required this.email,
      required this.NFTLikes,
      required this.collectionLikes});

  String get pk => address;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        address: json['uAddress'],
        username: json['username'],
        profilePicture: json['profilePicture'] ?? "https://ia801703.us.archive.org/6/items/twitter-default-pfp/e.png",
        email: json['email'],
        NFTLikes: json['NFTLikes'],
        collectionLikes: json["collectionLikes"]);
  }

  @override
  String toString() =>
      "User(address: $address, username: $username, profilePicture: $profilePicture, email: $email, NFTLikes: $NFTLikes, collectionLikes: $collectionLikes)";

  Future<List<NFT>> get ownedNFTs async {
  List JSONList = await getRequest("nfts", {"currentOwner": pk});
  List<NFT> ownedNFTs = JSONList.map((item) => NFT.fromJson(item)).toList();
  return ownedNFTs;
}
  Future<List<NFT>> get likedNFTs async {
    List JSONList = await getRequest("favorites", {"user": pk});
    List<NFT> ownedNFTs = JSONList.map((item) => NFT.fromJson(item)).toList();
    return ownedNFTs;
  }

  Future<bool> userLikedNFT(Map<String, dynamic> NFTInfo) async {
    final List JSONList =
        await getRequest("favorites", {...NFTInfo, "user": pk});
    return JSONList.isNotEmpty;
  }

  Future<bool> likeNFT(Map<String, dynamic> NFTInfo,bool liked) async {
    if(liked){
      return (await deleteRequest("favorites", {...NFTInfo, "user": pk}));
    }
    return (await postRequest("favorites", {...NFTInfo, "user": pk}));
  }

  Future<bool> userWatchListedCollection(String address) async {
    final List JSONList =
    await getRequest("watchLists", {"nftCollection": address, "user": pk});
    return JSONList.isNotEmpty;
  }

  Future<bool> watchListCollection(String address, bool watchListed) async {
    if(watchListed){
      return (await deleteRequest("watchLists", {"nftCollection": address, "user": pk}));
    }
    return (await postRequest("watchLists", {"nftCollection": address, "user": pk}));
  }

  Future<List<NFTCollection>> get watchlistedCollections async {
    List JSONList = await getRequest("watchLists", {"user": pk});
    List<NFTCollection> watchListedCollections = JSONList.map((item) => NFTCollection.fromJson(item)).toList();
    return watchListedCollections;
  }
}
