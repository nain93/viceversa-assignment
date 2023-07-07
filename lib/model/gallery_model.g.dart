// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GalleryModel _$$_GalleryModelFromJson(Map<String, dynamic> json) =>
    _$_GalleryModel(
      galContentId: json['galContentId'] as String,
      galContentTypeId: json['galContentTypeId'] as String,
      galTitle: json['galTitle'] as String,
      galWebImageUrl: json['galWebImageUrl'] as String,
      galCreatedtime: json['galCreatedtime'] as String,
      galModifiedtime: json['galModifiedtime'] as String,
      galPhotographyMonth: json['galPhotographyMonth'] as String,
      galPhotographyLocation: json['galPhotographyLocation'] as String,
      galPhotographer: json['galPhotographer'] as String,
      galSearchKeyword: json['galSearchKeyword'] as String,
    );

Map<String, dynamic> _$$_GalleryModelToJson(_$_GalleryModel instance) =>
    <String, dynamic>{
      'galContentId': instance.galContentId,
      'galContentTypeId': instance.galContentTypeId,
      'galTitle': instance.galTitle,
      'galWebImageUrl': instance.galWebImageUrl,
      'galCreatedtime': instance.galCreatedtime,
      'galModifiedtime': instance.galModifiedtime,
      'galPhotographyMonth': instance.galPhotographyMonth,
      'galPhotographyLocation': instance.galPhotographyLocation,
      'galPhotographer': instance.galPhotographer,
      'galSearchKeyword': instance.galSearchKeyword,
    };
