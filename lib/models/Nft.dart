import "../backend/requests.dart";
import 'TransactionHistory.dart';

class NFT {
  final String address;
  final int nID;
  final String name;
  final String? description;
  final String metaDataType;
  final String dataLink;
  final String collectionName;
  final String creator;
  final String owner;
  final int marketStatus;
  int likeCount;

  NFT({ required this.address, required this.nID,required this.name,
    required this.description,required this.metaDataType,required this.dataLink,
    required this.collectionName, required this.creator,required this.owner,
    required this.marketStatus, this.likeCount = 0 });

  Map<String, dynamic> get pk {
    return { "address": address, "nID": nID };
  }

  @override
  String toString() => "NFT(address: $address, nID: $nID, name: $name, "
      "description: $description, metaDataType: $metaDataType, "
      "dataLink: $dataLink, collectionName: $collectionName, "
      "creatorName: creatorName, currentOwner: $owner, "
      "marketStatus: $marketStatus, likeCount: $likeCount)";

  factory NFT.fromJson(Map<String, dynamic> json) {
    return NFT(
      address: json['address'].toString(),
      nID: json['nID'],
      name: json['name'],
      description: json['description'],
      metaDataType: json['metaDataType'],
      dataLink: json['nftFile'],
      collectionName: json['collectionName'],
      creator: json['creator'],
      owner: json['currentOwner'],
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
    'creatorName': creator,
    'currentOwner': owner,
    'marketStatus': marketStatus,
  };

  @override
  bool operator == (Object other) {
    if (other is NFT) {
      return (other.address == address && other.nID == nID &&
          other.name == name && other.description == description &&
          other.metaDataType == metaDataType && other.dataLink == dataLink &&
          other.collectionName == collectionName && other.creator == creator &&
          other.owner == owner && other.marketStatus == marketStatus &&
          other.likeCount == likeCount);
    }
    return false;
  }

  Future<List<TransactionHistory>> get transactionHistory async {
    List JSONList = await getRequest("transactionHistory", pk);
    List<TransactionHistory> history = JSONList.map((item) => TransactionHistory.fromJson(item)).toList();
    history.sort((e1, e2) => e1.date.compareTo(e2.date));
    return history;
  }

}