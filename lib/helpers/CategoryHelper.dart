import 'package:properly_made_nft_market/backend/requests.dart';
import 'package:properly_made_nft_market/models/Category.dart';

Future<List<Category>> getCategories(Map<String,dynamic>? query)async {
  List JsonList = await getRequest("categories", query);
  List<Category> categories = JsonList.map((item) => Category.fromJson(item)).toList();
  return categories;
}