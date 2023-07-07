import 'package:viceversa_assignment/model/gallery_model.dart';
import 'package:viceversa_assignment/utils.dart';

abstract class IGalleryRepository {
  Future<List<GalleryModel>> getGalleryList({required int pageNo});
  Future<GalleryModel?> getGalleryDetail({required String title});
}

class GalleryRepository implements IGalleryRepository {
  const GalleryRepository._();
  static GalleryRepository instance = const GalleryRepository._();

  @override
  Future<List<GalleryModel>> getGalleryList({required int pageNo}) async {
    var result = await dio.get(
        '/galleryList1?pageNo=$pageNo&MobileApp=viceversa&MobileOS=IOS&_type=json&serviceKey=$serviceKey');
    if (result.data != null) {
      var list = result.data['response']['body']['items']['item'];
      return list.map<GalleryModel>((e) => GalleryModel.fromJson(e)).toList();
    }
    return [];
  }

  @override
  Future<GalleryModel?> getGalleryDetail({required String title}) async {
    var parsedTitle = Uri.encodeComponent(title);
    var result = await dio.get(
        '/galleryDetailList1?title=$parsedTitle&MobileApp=viceversa&MobileOS=IOS&_type=json&serviceKey=$serviceKey');

    if (result.data['response']['body']['items'] != '') {
      var list = result.data['response']['body']['items']['item'];
      return GalleryModel.fromJson(list.first);
    }
    return null;
  }
}
