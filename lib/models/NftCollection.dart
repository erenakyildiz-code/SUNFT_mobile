import 'Nft.dart';
import "../backend/requests.dart";

class NFTCollection {
  final String? address;
  final String name;
  final String? description;
  final String collectionImage;
  final String owner;
  int numLikes;
  final String category;
  int NFTLikes;

  String? get pk => address;

  NFTCollection({ this.address, required this.name, required this.description,
    required this.collectionImage,required this.category, this.numLikes = 0,
    this.NFTLikes = 0, required this.owner });

  factory NFTCollection.fromJson(Map<String, dynamic> json) {
    return NFTCollection(
      address: json["address"],
      name: json['name'],
      collectionImage: json['collectionImage'],
      description: json['description'],
      numLikes: json["numLikes"],
      owner: json["owner"],
      category: json["category"],
      NFTLikes: json["NFTLikes"],
    );
  }

  Map<String, dynamic> toJson() => {
    'address': address,
    'name': name,
    'description': description,
    'collectionImage':collectionImage,
    'numLikes': numLikes,
    'owner': owner,
    'category': category,
    "NFTLikes": NFTLikes,
  };

  Future<List<NFT>> get NFTs async {
    List<NFT> NFTs = <NFT>[];
    if (pk != null) {
        final List JSONList = await getRequest("nfts", {"collection": pk });
        NFTs = JSONList.map((item) => NFT.fromJson(item)).toList();
    }
    return NFTs;
  }

  @override
  String toString() => "NFTCollection(address: $address, name: $name, description: $description, collectionImage: $collectionImage, numLikes: $numLikes, owner: $owner, category: $category, NFTLikes: $NFTLikes)";

}