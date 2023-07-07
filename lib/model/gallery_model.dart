import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_model.freezed.dart';
part 'gallery_model.g.dart';

@freezed
class GalleryModel with _$GalleryModel {
  const GalleryModel._();
  factory GalleryModel({
    required String galContentId,
    required String galContentTypeId,
    required String galTitle,
    required String galWebImageUrl,
    required String galCreatedtime,
    required String galModifiedtime,
    required String galPhotographyMonth,
    required String galPhotographyLocation,
    required String galPhotographer,
    required String galSearchKeyword,
  }) = _GalleryModel;

  factory GalleryModel.fromJson(Map<String, dynamic> json) =>
      _$GalleryModelFromJson(json);
}
