// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferImpl _$$OfferImplFromJson(Map<String, dynamic> json) => _$OfferImpl(
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      memberPrice: (json['memberPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$OfferImplToJson(_$OfferImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'quantity': instance.quantity,
      'memberPrice': instance.memberPrice,
    };
