import 'dart:convert';

import 'package:api_photo_gallery/model/photo_model.dart';
import 'package:api_photo_gallery/screen/photo_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  Future fetchPhotos() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/'));
      final List<dynamic> photosList = jsonDecode(response.body);
      List<Photo> photos = [];
      for (final photo in photosList) {
        photos.add(Photo.fromJson(photo));
      }
      return photos;
    } catch (e) {
      return 'Failed';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: FutureBuilder(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.data == 'Failed') {
            return const Center(
              child: Text(
                'Failed to load photos \n Check internet connection',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent),
              ),
            );
          } else if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final photo = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PhotoDetails(photo: photo),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: SizedBox.square(
                        child: Image.network(photo.thumbnailUrl),
                      ),
                      title: Text(
                        photo.title,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
