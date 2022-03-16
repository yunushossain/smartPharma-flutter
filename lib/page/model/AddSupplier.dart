class AddSupplier {

  late String sname;
  late String semail;
  late String scontact;
  late String saddress;

//<editor-fold desc="Data Methods">

  AddSupplier({
    required this.sname,
    required this.semail,
    required this.scontact,
    required this.saddress,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddSupplier &&
          runtimeType == other.runtimeType &&
          sname == other.sname &&
          semail == other.semail &&
          scontact == other.scontact &&
          saddress == other.saddress);

  @override
  int get hashCode =>
      sname.hashCode ^ semail.hashCode ^ scontact.hashCode ^ saddress.hashCode;

  @override
  String toString() {
    return 'AddSupplier{' +
        ' sname: $sname,' +
        ' semail: $semail,' +
        ' scontact: $scontact,' +
        ' saddress: $saddress,' +
        '}';
  }

  AddSupplier copyWith({
    String? sname,
    String? semail,
    String? scontact,
    String? saddress,
  }) {
    return AddSupplier(
      sname: sname ?? this.sname,
      semail: semail ?? this.semail,
      scontact: scontact ?? this.scontact,
      saddress: saddress ?? this.saddress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sname': this.sname,
      'semail': this.semail,
      'scontact': this.scontact,
      'saddress': this.saddress,
    };
  }

  factory AddSupplier.fromMap(Map<String, dynamic> map) {
    return AddSupplier(
      sname: map['sname'] as String,
      semail: map['semail'] as String,
      scontact: map['scontact'] as String,
      saddress: map['saddress'] as String,
    );
  }

//</editor-fold>
}