
import 'package:http/http.dart'; //You can also import the browser version
import 'package:web3dart/web3dart.dart';
import "package:properly_made_nft_market/ABIs/nftMarketAbi.dart" as nftMarket;
import "package:properly_made_nft_market/ABIs/SUcoinAbi.dart" as suCoin;

var httpClient = Client();
var apiUrl = "https://rpc.ankr.com/avalanche";

var ethClient = Web3Client(apiUrl, httpClient);

var suCoinContract = DeployedContract(ContractAbi.fromJson(suCoin.abi["abi"].toString(), "SUcoin"), EthereumAddress.fromHex(suCoin.abi["address"].toString()));
var suNFTmarketContract = DeployedContract(ContractAbi.fromJson(nftMarket.abi["abi"].toString(), "Market"), EthereumAddress.fromHex(nftMarket.abi["address"].toString()));