import '../variables.dart';

class NFT {
  final String address;
  final int nID;
  final String name;
  final String? description;
  final String metaDataType;
  final String dataLink;
  final String? collectionName;
  final String? creatorName;
  final String currentOwner;
  final int marketStatus;
  final int likeCount;

  NFT({ required this.address, required this.nID,required this.name,required this.description,required this.metaDataType,required this.dataLink,required this.collectionName, this.creatorName,required this.currentOwner,required this.marketStatus, this.likeCount = 0 });

  Map<String, dynamic> get pk {
    return { "address": address, "nID": nID };
  }

  @override
  String toString() => "NFT(address: $address, nID: $nID, name: $name, "
      "description: $description, metaDataType: $metaDataType, "
      "dataLink: $dataLink, collectionName: $collectionName, "
      "creatorName: creatorName, currentOwner: $currentOwner, "
      "marketStatus: $marketStatus, likeCount: $likeCount)";

  factory NFT.fromJson(Map<String, dynamic> json) {
    return NFT(
      address: json['address'].toString(),
      nID: json['nID'],
      name: json['name'],
      description: json['description'],
      metaDataType: json['metaDataType'],
      dataLink: "$ImagePath${json['nftFile']}",
      collectionName: json['collectionName'],
      creatorName: json['creator'],
      currentOwner: json['currentOwner'],
      marketStatus: json['marketStatus'],
      likeCount: json["numLikes"],
    );
  }

  Map<String, dynamic> toJson() => {
    'address': address,
    'nID': nID,
    'name': name,
    'description': description,
    'metaDataType':metaDataType,
    'dataLink': dataLink,
    'collectionName': collectionName,
    'creatorName': creatorName,
    'currentOwner': currentOwner,
    'marketStatus': marketStatus,
    "likeCount": likeCount
  };

  @override
  bool operator == (Object other) {
    if (other is NFT) {
      return (other.address == address && other.nID == nID &&
          other.name == name && other.description == description &&
          other.metaDataType == metaDataType && other.dataLink == dataLink &&
          other.collectionName == collectionName && other.creatorName == creatorName &&
          other.currentOwner == currentOwner && other.marketStatus == marketStatus &&
          other.likeCount == likeCount);
    }
    return false;
  }




}