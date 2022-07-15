

class categories{
  final String name;
  final String? pic1;
  final String? pic2;
  categories({required this.name,required this.pic1, required this.pic2});
  factory categories.fromJson(Map<String, dynamic> json){
    return categories(
        name : json["name"],
        pic1: json["backgroundImage"],
        pic2: json["foregroundImage"]
    );

  }Map<String, dynamic> toJson() => {
    'pic2' : pic2,
    'pic1': pic1,
    'name': name,
  };
}

class NFTobject {
  final int PRIMARYKEY;
  final String address;
  final int nID;
  final String? name;
  final String? description;
  final String metaDataType;
  final String dataLink;
  final String? collectionName;
  final String? creatorName;
  final String currentOwner;
  final int marketStatus;
  final int likeCount;
  NFTobject({required this.PRIMARYKEY,required this.address, required this.nID,required this.name,required this.description,required this.metaDataType,required this.dataLink,required this.collectionName,required this.creatorName,required this.currentOwner,required this.marketStatus, required this.likeCount});

  factory NFTobject.fromJson(Map<String, dynamic> json) {
    return NFTobject(
      PRIMARYKEY: json["id"],
      address: json['address'],
      nID: json['index'],
      name: json['name'],
      description: json['description'],
      metaDataType: json['metaDataType'],
      dataLink: json['dataLink'],
      collectionName: json['collectionName'],
      creatorName: json['creator'],
      currentOwner: json['currentOwner'],
      marketStatus: json['marketStatus'],
      likeCount: json["numLikes"],
    );
  }

  Map<String, dynamic> toJson() => {
    'PRIMARYKEY' : PRIMARYKEY,
    'UID' : address,
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
}

class NFTcollection {
  final String? name;
  final String? description;
  final String? collectionImage;
  final String? owner;
  final int? numLikes;
  final String? category;
  NFTcollection({required this.name, required this.description,required this.collectionImage,required this.category,required this.numLikes,required this.owner});

  factory NFTcollection.fromJson(Map<String, dynamic> json) {
    return NFTcollection(
      name: json['name'],
      collectionImage: json['collectionImage'],
      description: json['description'],
      numLikes : json["numLikes"],
      owner : json["owner"],
      category : json["category"],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'collectionImage':collectionImage,
    'numLikes': numLikes,
    'owner': owner,
    'category': category,
  };
}