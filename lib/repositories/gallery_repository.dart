import 'package:viceversa_assignment/model/gallery_model.dart';
import 'package:viceversa_assignment/utils.dart';

abstract class IGalleryRepository {
  Future<List<GalleryModel>> getFolderList({required int pageNo});
}

class GalleryRepository implements IGalleryRepository {
  const GalleryRepository._();
  static GalleryRepository instance = const GalleryRepository._();

  @override
  Future<List<GalleryModel>> getFolderList({required int pageNo}) async {
    var result = await dio.get(
        '/galleryList1?pageNo=$pageNo&MobileApp=viceversa&MobileOS=IOS&_type=json&serviceKey=$serviceKey');

    if (result.data != null) {
      var list = result.data['response']['body']['items']['item'];
      return list.map<GalleryModel>((e) => GalleryModel.fromJson(e)).toList();
    }
    return [];
  }
}
