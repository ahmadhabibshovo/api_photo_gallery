import 'package:api_photo_gallery/screen/photo_gallery.dart';
import 'package:api_photo_gallery/style/theme_data.dart';
import 'package:flutter/material.dart';

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const PhotoGallery(),
    );
  }
}
