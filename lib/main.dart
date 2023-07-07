import 'package:flutter/material.dart';
import 'package:viceversa_assignment/gallery_detail_view.dart';
import 'package:viceversa_assignment/gallery_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const GalleryListView(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) => GalleryDetailView(
              title: settings.arguments as String,
            ),
          );
        }
        return null;
      },
    );
  }
}
