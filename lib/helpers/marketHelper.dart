import "package:properly_made_nft_market/providers/ethereumProvider.dart" as ethereumProvider;
import '../backend/requests.dart';


Future<String> query(String functionName, List<dynamic> parameters) async{
  var sucoinBalFunc =  ethereumProvider.suNFTmarketContract.function(functionName);

  List<dynamic> response;
  try {
    response = await ethereumProvider.ethClient.call(contract: ethereumProvider.suNFTmarketContract, function: sucoinBalFunc , params: parameters);


  } catch (error, trace) {
    print(error);
    print(trace);
    throw error;
  }


  return response[0].toString();
}