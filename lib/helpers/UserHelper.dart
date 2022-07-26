import '../backend/requests.dart';
import '../models/User.dart';

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