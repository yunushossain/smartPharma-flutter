import 'dart:core';
class Purchase{
  late int pid;
  late String sname;
  late int pinvonum;
  late String ppaytype;
  late String pstdate;
  late String mname;
  late String mpaking;
  late String batchid;
  late String expdate;
  late int quantity;
  late double mrp;
  late double rate;
  late double amount;
  late double gtotal;

//<editor-fold desc="Data Methods">

  Purchase({
    required this.pid,
    required this.sname,
    required this.pinvonum,
    required this.ppaytype,
    required this.pstdate,
    required this.mname,
    required this.mpaking,
    required this.batchid,
    required this.expdate,
    required this.quantity,
    required this.mrp,
    required this.rate,
    required this.amount,
    required this.gtotal,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Purchase &&
          runtimeType == other.runtimeType &&
          pid == other.pid &&
          sname == other.sname &&
          pinvonum == other.pinvonum &&
          ppaytype == other.ppaytype &&
          pstdate == other.pstdate &&
          mname == other.mname &&
          mpaking == other.mpaking &&
          batchid == other.batchid &&
          expdate == other.expdate &&
          quantity == other.quantity &&
          mrp == other.mrp &&
          rate == other.rate &&
          amount == other.amount &&
          gtotal == other.gtotal);

  @override
  int get hashCode =>
      pid.hashCode ^
      sname.hashCode ^
      pinvonum.hashCode ^
      ppaytype.hashCode ^
      pstdate.hashCode ^
      mname.hashCode ^
      mpaking.hashCode ^
      batchid.hashCode ^
      expdate.hashCode ^
      quantity.hashCode ^
      mrp.hashCode ^
      rate.hashCode ^
      amount.hashCode ^
      gtotal.hashCode;

  @override
  String toString() {
    return 'Purchase{' +
        ' pid: $pid,' +
        ' sname: $sname,' +
        ' pinvonum: $pinvonum,' +
        ' ppaytype: $ppaytype,' +
        ' pstdate: $pstdate,' +
        ' mname: $mname,' +
        ' mpaking: $mpaking,' +
        ' batchid: $batchid,' +
        ' expdate: $expdate,' +
        ' quantity: $quantity,' +
        ' mrp: $mrp,' +
        ' rate: $rate,' +
        ' amount: $amount,' +
        ' gtotal: $gtotal,' +
        '}';
  }

  Purchase copyWith({
    int? pid,
    String? sname,
    int? pinvonum,
    String? ppaytype,
    String? pstdate,
    String? mname,
    String? mpaking,
    String? batchid,
    String? expdate,
    int? quantity,
    double? mrp,
    double? rate,
    double? amount,
    double? gtotal,
  }) {
    return Purchase(
      pid: pid ?? this.pid,
      sname: sname ?? this.sname,
      pinvonum: pinvonum ?? this.pinvonum,
      ppaytype: ppaytype ?? this.ppaytype,
      pstdate: pstdate ?? this.pstdate,
      mname: mname ?? this.mname,
      mpaking: mpaking ?? this.mpaking,
      batchid: batchid ?? this.batchid,
      expdate: expdate ?? this.expdate,
      quantity: quantity ?? this.quantity,
      mrp: mrp ?? this.mrp,
      rate: rate ?? this.rate,
      amount: amount ?? this.amount,
      gtotal: gtotal ?? this.gtotal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pid': this.pid,
      'sname': this.sname,
      'pinvonum': this.pinvonum,
      'ppaytype': this.ppaytype,
      'pstdate': this.pstdate,
      'mname': this.mname,
      'mpaking': this.mpaking,
      'batchid': this.batchid,
      'expdate': this.expdate,
      'quantity': this.quantity,
      'mrp': this.mrp,
      'rate': this.rate,
      'amount': this.amount,
      'gtotal': this.gtotal,
    };
  }

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      pid: map['pid'] as int,
      sname: map['sname'] as String,
      pinvonum: map['pinvonum'] as int,
      ppaytype: map['ppaytype'] as String,
      pstdate: map['pstdate'] as String,
      mname: map['mname'] as String,
      mpaking: map['mpaking'] as String,
      batchid: map['batchid'] as String,
      expdate: map['expdate'] as String,
      quantity: map['quantity'] as int,
      mrp: map['mrp'] as double,
      rate: map['rate'] as double,
      amount: map['amount'] as double,
      gtotal: map['gtotal'] as double,
    );
  }

//</editor-fold>
}