import 'package:api_photo_gallery/model/photo_model.dart';
import 'package:flutter/material.dart';

class PhotoDetails extends StatelessWidget {
  const PhotoDetails({super.key, required this.photo});
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: orientation == Orientation.portrait
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              if (orientation == Orientation.portrait)
                const SizedBox(
                  height: 50,
                ),
              orientation == Orientation.portrait
                  ? Image.network(
                      photo.url,
                    )
                  : Image.network(
                      photo.url,
                      height: 150,
                    ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Title: ${photo.title}',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Center(
                child: Text(
                  'ID: ${photo.id.toString()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
