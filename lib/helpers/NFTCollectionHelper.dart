import 'package:properly_made_nft_market/backend/requests.dart';
import 'package:properly_made_nft_market/models/NftCollection.dart';

Future<List<NFTCollection>> getTrendingCollections(Map<String,dynamic>? query)async {
  List JsonList = await getRequest("trending/collection", query);
  List<NFTCollection> collections = JsonList.map((item) => NFTCollection.fromJson(item)).toList();
  return collections;
}