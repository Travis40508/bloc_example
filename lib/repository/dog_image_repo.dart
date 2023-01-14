
import 'package:bloc_example_tutorial/repository/dog_image_service.dart';

/// Class that we'll provide in our repository provider in main.dart.
class DogImageRepo {
  final DogImageService service;

  const DogImageRepo({
    required this.service,
  });

  Future<String> fetchRandomDogImage() async => await service.fetchRandomDogImage();
}