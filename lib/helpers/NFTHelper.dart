import 'package:properly_made_nft_market/backend/requests.dart';
import 'package:properly_made_nft_market/models/Nft.dart';

Future<List<NFT>> getTrendingNFTs(Map<String,dynamic>? query)async {
  List JsonList = await getRequest("trending/nft", query);
  List<NFT> nfts = JsonList.map((item) => NFT.fromJson(item)).toList();
  return nfts;
}