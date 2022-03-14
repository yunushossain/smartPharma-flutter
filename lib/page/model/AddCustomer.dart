import 'dart:core';
class AddCustomer{
  late String cname;
  late String cemail;
  late String ccontact;
  late String caddress;
  late String cdname;
  late String cdaddress;

//<editor-fold desc="Data Methods">

  AddCustomer({
    required this.cname,
    required this.cemail,
    required this.ccontact,
    required this.caddress,
    required this.cdname,
    required this.cdaddress,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddCustomer &&
          runtimeType == other.runtimeType &&
          cname == other.cname &&
          cemail == other.cemail &&
          ccontact == other.ccontact &&
          caddress == other.caddress &&
          cdname == other.cdname &&
          cdaddress == other.cdaddress);

  @override
  int get hashCode =>
      cname.hashCode ^
      cemail.hashCode ^
      ccontact.hashCode ^
      caddress.hashCode ^
      cdname.hashCode ^
      cdaddress.hashCode;

  @override
  String toString() {
    return 'AddCustomer{' +
        ' cname: $cname,' +
        ' cemail: $cemail,' +
        ' ccontact: $ccontact,' +
        ' caddress: $caddress,' +
        ' cdname: $cdname,' +
        ' cdaddress: $cdaddress,' +
        '}';
  }

  AddCustomer copyWith({
    String? cname,
    String? cemail,
    String? ccontact,
    String? caddress,
    String? cdname,
    String? cdaddress,
  }) {
    return AddCustomer(
      cname: cname ?? this.cname,
      cemail: cemail ?? this.cemail,
      ccontact: ccontact ?? this.ccontact,
      caddress: caddress ?? this.caddress,
      cdname: cdname ?? this.cdname,
      cdaddress: cdaddress ?? this.cdaddress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cname': this.cname,
      'cemail': this.cemail,
      'ccontact': this.ccontact,
      'caddress': this.caddress,
      'cdname': this.cdname,
      'cdaddress': this.cdaddress,
    };
  }

  factory AddCustomer.fromMap(Map<String, dynamic> map) {
    return AddCustomer(
      cname: map['cname'] as String,
      cemail: map['cemail'] as String,
      ccontact: map['ccontact'] as String,
      caddress: map['caddress'] as String,
      cdname: map['cdname'] as String,
      cdaddress: map['cdaddress'] as String,
    );
  }

//</editor-fold>
}