class User {
  final String address;
  final String username;
  final String? profilePicture;
  final String email;
  final int totalNFTLikes;
  final int totalCollectionLikes;

  User({required this.address,required this.username,required this.profilePicture,required this.email, required this.totalNFTLikes,required this.totalCollectionLikes});

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

}