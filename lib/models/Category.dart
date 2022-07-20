import '../backend/requests.dart';
import '../variables.dart';
import 'NftCollection.dart';

class Category {
  String name;
  String backgroundPicture;
  String foregroundPicture;
  Category({required this.name, required this.backgroundPicture, required this.foregroundPicture});

  String get pk => name;

  Future<List<NFTCollection>> get collections async {
    final List JSONList = await getRequest("nftcollections", {"collection": pk });
    List<NFTCollection> collections =
    JSONList.map((item) => NFTCollection.fromJson(item)).toList();
    return collections;
  }

  @override
  String toString() => "Category(name: $name, background: $backgroundPicture, foreground: $foregroundPicture)";

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        name : json['name'],
        backgroundPicture : "$ImagePath${json['backgroundPicture']}",
        foregroundPicture : "$ImagePath${json['foregroundPicture']}",
    );

  }
}