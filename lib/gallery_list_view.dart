import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:viceversa_assignment/gallery_detail_view.dart';
import 'package:viceversa_assignment/model/gallery_model.dart';
import 'package:viceversa_assignment/repositories/gallery_repository.dart';

class GalleryListView extends StatefulWidget {
  const GalleryListView({super.key});

  @override
  State<GalleryListView> createState() => _GalleryListViewState();
}

class _GalleryListViewState extends State<GalleryListView> {
  late ScrollController _controller;
  var galleryList = <GalleryModel>[];
  var pageNo = 1;
  var loading = false;

  Future<void> getInitialGalleryList() async {
    try {
      setState(() {
        loading = true;
      });
      var list =
          await GalleryRepository.instance.getGalleryList(pageNo: pageNo);
      setState(() {
        pageNo++;
        galleryList = list;
      });
    } catch (error) {
      if (kDebugMode) {
        print('error:$error');
      }
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> loadMore() async {
    if (loading || galleryList.length < (pageNo - 1) * 10) return;

    setState(() {
      loading = true;
    });
    try {
      var moreList =
          await GalleryRepository.instance.getGalleryList(pageNo: pageNo);
      setState(() {
        pageNo++;
        galleryList.addAll(moreList);
      });
    } catch (error) {
      if (kDebugMode) {
        print('error:$error');
      }
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void goGalleryDetail({required String title}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryDetailView(
          title: title,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getInitialGalleryList();
    _controller = ScrollController();
    _controller.addListener(() {
      if (galleryList.isNotEmpty &&
          _controller.position.pixels >
              _controller.position.maxScrollExtent - 100) {
        loadMore();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (pageNo == 1 && loading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 10.0,
                      mainAxisExtent: 300,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        var gallery = galleryList[index];
                        return InkWell(
                          onTap: () => goGalleryDetail(title: gallery.galTitle),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                gallery.galWebImageUrl,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                              Text(gallery.galTitle),
                              Text(gallery.galPhotographer),
                            ],
                          ),
                        );
                      },
                      childCount: galleryList.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
      ),
    );
  }
}
