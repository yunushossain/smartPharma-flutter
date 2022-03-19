import 'dart:core';
class AddMedicine{

  late  String mname;
  late String mgname;
  late String mpaking;
  late  String  sname;

//<editor-fold desc="Data Methods">

  AddMedicine({
    required this.mname,
    required this.mgname,
    required this.mpaking,
    required this.sname,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddMedicine &&
          runtimeType == other.runtimeType &&
          mname == other.mname &&
          mgname == other.mgname &&
          mpaking == other.mpaking &&
          sname == other.sname);

  @override
  int get hashCode =>
      mname.hashCode ^ mgname.hashCode ^ mpaking.hashCode ^ sname.hashCode;

  @override
  String toString() {
    return 'AddMedicine{' +
        ' mname: $mname,' +
        ' mgname: $mgname,' +
        ' mpaking: $mpaking,' +
        ' sname: $sname,' +
        '}';
  }

  AddMedicine copyWith({
    String? mname,
    String? mgname,
    String? mpaking,
    String? sname,
  }) {
    return AddMedicine(
      mname: mname ?? this.mname,
      mgname: mgname ?? this.mgname,
      mpaking: mpaking ?? this.mpaking,
      sname: sname ?? this.sname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mname': this.mname,
      'mgname': this.mgname,
      'mpaking': this.mpaking,
      'sname': this.sname,
    };
  }

  factory AddMedicine.fromMap(Map<String, dynamic> map) {
    return AddMedicine(
      mname: map['mname'] as String,
      mgname: map['mgname'] as String,
      mpaking: map['mpaking'] as String,
      sname: map['sname'] as String,
    );
  }

//</editor-fold>
}