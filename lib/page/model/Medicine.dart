import 'dart:core';
class Medicine{

  late int mid;
  late  String mname;
  late String mgname;
  late String mpaking;
  late  String  sname;

//<editor-fold desc="Data Methods">

  Medicine({
    required this.mid,
    required this.mname,
    required this.mgname,
    required this.mpaking,
    required this.sname,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medicine &&
          runtimeType == other.runtimeType &&
          mid == other.mid &&
          mname == other.mname &&
          mgname == other.mgname &&
          mpaking == other.mpaking &&
          sname == other.sname);

  @override
  int get hashCode =>
      mid.hashCode ^
      mname.hashCode ^
      mgname.hashCode ^
      mpaking.hashCode ^
      sname.hashCode;

  @override
  String toString() {
    return 'Medicine{' +
        ' mid: $mid,' +
        ' mname: $mname,' +
        ' mgname: $mgname,' +
        ' mpaking: $mpaking,' +
        ' sname: $sname,' +
        '}';
  }

  Medicine copyWith({
    int? mid,
    String? mname,
    String? mgname,
    String? mpaking,
    String? sname,
  }) {
    return Medicine(
      mid: mid ?? this.mid,
      mname: mname ?? this.mname,
      mgname: mgname ?? this.mgname,
      mpaking: mpaking ?? this.mpaking,
      sname: sname ?? this.sname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mid': this.mid,
      'mname': this.mname,
      'mgname': this.mgname,
      'mpaking': this.mpaking,
      'sname': this.sname,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      mid: map['mid'] as int,
      mname: map['mname'] as String,
      mgname: map['mgname'] as String,
      mpaking: map['mpaking'] as String,
      sname: map['sname'] as String,
    );
  }

//</editor-fold>
}