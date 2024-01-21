class Crypto {
  Crypto({
    this.coin,
    this.wallet,
    this.network,});

  Crypto.fromJson(dynamic json) {
    coin = json['coin'];
    wallet = json['wallet'];
    network = json['network'];
  }
  String? coin;
  String? wallet;
  String? network;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coin'] = coin;
    map['wallet'] = wallet;
    map['network'] = network;
    return map;
  }

}