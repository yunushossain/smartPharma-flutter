import 'dart:core';
class ShowInvoice{

  late int id;
  late String customerName;
  late String date;
  late double  totalAmount;
  late double  totalDiscount;
  late double  netTotal;

//<editor-fold desc="Data Methods">

  ShowInvoice({
    required this.id,
    required this.customerName,
    required this.date,
    required this.totalAmount,
    required this.totalDiscount,
    required this.netTotal,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShowInvoice &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          customerName == other.customerName &&
          date == other.date &&
          totalAmount == other.totalAmount &&
          totalDiscount == other.totalDiscount &&
          netTotal == other.netTotal);

  @override
  int get hashCode =>
      id.hashCode ^
      customerName.hashCode ^
      date.hashCode ^
      totalAmount.hashCode ^
      totalDiscount.hashCode ^
      netTotal.hashCode;

  @override
  String toString() {
    return 'ShowInvoice{' +
        ' id: $id,' +
        ' customerName: $customerName,' +
        ' date: $date,' +
        ' totalAmount: $totalAmount,' +
        ' totalDiscount: $totalDiscount,' +
        ' netTotal: $netTotal,' +
        '}';
  }

  ShowInvoice copyWith({
    int? id,
    String? customerName,
    String? date,
    double? totalAmount,
    double? totalDiscount,
    double? netTotal,
  }) {
    return ShowInvoice(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      date: date ?? this.date,
      totalAmount: totalAmount ?? this.totalAmount,
      totalDiscount: totalDiscount ?? this.totalDiscount,
      netTotal: netTotal ?? this.netTotal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'customerName': this.customerName,
      'date': this.date,
      'totalAmount': this.totalAmount,
      'totalDiscount': this.totalDiscount,
      'netTotal': this.netTotal,
    };
  }

  factory ShowInvoice.fromMap(Map<String, dynamic> map) {
    return ShowInvoice(
      id: map['id'] as int,
      customerName: map['customerName'] as String,
      date: map['date'] as String,
      totalAmount: map['totalAmount'] as double,
      totalDiscount: map['totalDiscount'] as double,
      netTotal: map['netTotal'] as double,
    );
  }

//</editor-fold>
}