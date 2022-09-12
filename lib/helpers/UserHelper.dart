import '../backend/requests.dart';
import '../models/User.dart';
import "package:properly_made_nft_market/providers/ethereumProvider.dart" as ethereumProvider;


Future<User?> getUser({String? username, String? address}) async {
  List response = [];
  if (username != null) {
    response = await getRequest("users", {"username": username});
  }
  else if (address != null) {
    response = await getRequest("users", {"uAddress": address});
  }
  if (response.isNotEmpty) {
    return User.fromJson(response[0]);
  }
  return null;
}
//Free functions can be queried.
Future<String> query(String functionName, List<dynamic> parameters) async{
  var sucoinBalFunc =  ethereumProvider.suCoinContract.function(functionName);
  print(parameters);
  List<dynamic> response;
  try {
    response = await ethereumProvider.ethClient.call(contract: ethereumProvider.suCoinContract, function: sucoinBalFunc , params: parameters);


  } catch (error, trace) {
    print(error);
    print(trace);
    throw error;
  }


  return response[0].toString();
}
