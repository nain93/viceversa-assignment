import 'package:flutter/material.dart';
import 'package:viceversa_assignment/model/gallery_model.dart';
import 'package:viceversa_assignment/repositories/gallery_repository.dart';

class GalleryDetailView extends StatefulWidget {
  const GalleryDetailView({super.key, required this.title});
  final String title;

  @override
  State<GalleryDetailView> createState() => _GalleryDetailViewState();
}

class _GalleryDetailViewState extends State<GalleryDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상세'),
      ),
      body: SafeArea(
        child: FutureBuilder<GalleryModel?>(
          future:
              GalleryRepository.instance.getGalleryDetail(title: widget.title),
          builder: (context, snapshot) {
            var gallery = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData && gallery != null) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InteractiveViewer(
                        child: Image.network(
                          snapshot.data!.galWebImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(snapshot.data!.galTitle),
                      Text(snapshot.data!.galPhotographer),
                      Text(snapshot.data!.galPhotographyLocation),
                      Text(snapshot.data!.galPhotographyMonth),
                      Text(snapshot.data!.galSearchKeyword),
                    ],
                  ),
                ),
              );
            }

            return const Center(
              child: Text('데이터가 없습니다.'),
            );
          },
        ),
      ),
    );
  }
}
