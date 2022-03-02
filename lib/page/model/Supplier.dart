import 'dart:core';

class Supplier{
  late int sid;
  late String sname;
  late String semail;
  late String scontact;
  late String saddress;

//<editor-fold desc="Data Methods">

  Supplier({
    required this.sid,
    required this.sname,
    required this.semail,
    required this.scontact,
    required this.saddress,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Supplier &&
          runtimeType == other.runtimeType &&
          sid == other.sid &&
          sname == other.sname &&
          semail == other.semail &&
          scontact == other.scontact &&
          saddress == other.saddress);

  @override
  int get hashCode =>
      sid.hashCode ^
      sname.hashCode ^
      semail.hashCode ^
      scontact.hashCode ^
      saddress.hashCode;

  @override
  String toString() {
    return 'Supplier{' +
        ' sid: $sid,' +
        ' sname: $sname,' +
        ' semail: $semail,' +
        ' scontact: $scontact,' +
        ' saddress: $saddress,' +
        '}';
  }

  Supplier copyWith({
    int? sid,
    String? sname,
    String? semail,
    String? scontact,
    String? saddress,
  }) {
    return Supplier(
      sid: sid ?? this.sid,
      sname: sname ?? this.sname,
      semail: semail ?? this.semail,
      scontact: scontact ?? this.scontact,
      saddress: saddress ?? this.saddress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sid': this.sid,
      'sname': this.sname,
      'semail': this.semail,
      'scontact': this.scontact,
      'saddress': this.saddress,
    };
  }

  factory Supplier.fromMap(Map<String, dynamic> map) {
    return Supplier(
      sid: map['sid'] as int,
      sname: map['sname'] as String,
      semail: map['semail'] as String,
      scontact: map['scontact'] as String,
      saddress: map['saddress'] as String,
    );
  }

//</editor-fold>
}