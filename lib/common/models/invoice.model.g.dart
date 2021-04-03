// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) {
  return InvoiceModel(
    id: json['id'] as String,
    status: json['status'] as String,
    date: json['date'] as String,
    tax: json['tax'] as String,
    shipping: json['shipping'] as String,
    total: json['total'] as String,
  );
}

Map<String, dynamic> _$InvoiceModelToJson(InvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'date': instance.date,
      'tax': instance.tax,
      'shipping': instance.shipping,
      'total': instance.total,
    };
