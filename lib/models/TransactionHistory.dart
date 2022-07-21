
class TransactionHistory {
  final String oldOwner;
  final String newOwner;
  final int price;
  final DateTime date;
  
  @override
  String toString() => "Transaction(oldOwner: $oldOwner, newOwner: $newOwner, price: ${price.toString()}, date: ${date.toString()})";

  TransactionHistory({ required this.oldOwner, required this.newOwner, required this.price, required this.date });

  factory TransactionHistory.fromJson(Map<String, dynamic> json) {
    return TransactionHistory(
      oldOwner: json["oldOwner"],
      newOwner: json["newOwner"],
      price: json["price"],
      date: DateTime.parse(json["time"])
    );
  }

  Map<String, dynamic> toJson() => {
    "oldOwner": oldOwner,
    "newOwner": newOwner,
    "price": price,
    "time": date.toString()
  };

  @override
  bool operator == (Object other) {
    if (other is TransactionHistory) {
      return (oldOwner == other.oldOwner && newOwner == other.newOwner
          && price == other.price && date == other.date);
    }
    return false;
  }

}