import 'dart:core';
class AddPurchase {

  late String sname;
  late String pstdate;
  late String mname;
  late int quantity;
  late double rate;
  late double amount;

//<editor-fold desc="Data Methods">

  AddPurchase({
    required this.sname,
    required this.pstdate,
    required this.mname,
    required this.quantity,
    required this.rate,
    required this.amount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddPurchase &&
          runtimeType == other.runtimeType &&
          sname == other.sname &&
          pstdate == other.pstdate &&
          mname == other.mname &&
          quantity == other.quantity &&
          rate == other.rate &&
          amount == other.amount);

  @override
  int get hashCode =>
      sname.hashCode ^
      pstdate.hashCode ^
      mname.hashCode ^
      quantity.hashCode ^
      rate.hashCode ^
      amount.hashCode;

  @override
  String toString() {
    return 'AddPurchase{' +
        ' sname: $sname,' +
        ' pstdate: $pstdate,' +
        ' mname: $mname,' +
        ' quantity: $quantity,' +
        ' rate: $rate,' +
        ' amount: $amount,' +
        '}';
  }

  AddPurchase copyWith({
    String? sname,
    String? pstdate,
    String? mname,
    int? quantity,
    double? rate,
    double? amount,
  }) {
    return AddPurchase(
      sname: sname ?? this.sname,
      pstdate: pstdate ?? this.pstdate,
      mname: mname ?? this.mname,
      quantity: quantity ?? this.quantity,
      rate: rate ?? this.rate,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sname': this.sname,
      'pstdate': this.pstdate,
      'mname': this.mname,
      'quantity': this.quantity,
      'rate': this.rate,
      'amount': this.amount,
    };
  }

  factory AddPurchase.fromMap(Map<String, dynamic> map) {
    return AddPurchase(
      sname: map['sname'] as String,
      pstdate: map['pstdate'] as String,
      mname: map['mname'] as String,
      quantity: map['quantity'] as int,
      rate: map['rate'] as double,
      amount: map['amount'] as double,
    );
  }

//</editor-fold>
}


