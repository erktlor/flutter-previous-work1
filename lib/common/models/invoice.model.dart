import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice.model.g.dart';

@JsonSerializable()
class InvoiceModel {
  final String id;
  final String status;
  final String date;
  final String tax;
  final String shipping;
  final String total;

  InvoiceModel({
    @required this.id,
    @required this.status,
    @required this.date,
    @required this.tax,
    @required this.shipping,
    @required this.total,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceModelToJson(this);
}
