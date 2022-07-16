import 'Nft.dart';

class NFTCollection {
  final String name;
  final String? description;
  final String collectionImage;
  final String owner;
  int numLikes;
  final String category;
  int NFTLikes;
  List<NFT> NFTs;

  NFTCollection({ required this.name, required this.description,
    required this.collectionImage,required this.category, this.numLikes = 0,
    this.NFTLikes = 0, required this.owner, this.NFTs = const <NFT>[] });

  factory NFTCollection.fromJson(Map<String, dynamic> json) {
    return NFTCollection(
      name: json['name'],
      collectionImage: json['collectionImage'],
      description: json['description'],
      numLikes: json["numLikes"],
      owner: json["owner"],
      category: json["category"],
      NFTLikes: json["NFTLikes"],
      NFTs: json["NFTs"].map((nft) => NFT.fromJson(nft)).toList()
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'collectionImage':collectionImage,
    'numLikes': numLikes,
    'owner': owner,
    'category': category,
    "NFTLikes": NFTLikes,
  };
}