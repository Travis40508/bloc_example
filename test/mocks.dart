
import 'package:bloc_example_tutorial/repository/dog_image_repo.dart';
import 'package:mocktail/mocktail.dart';

/// Fake objects for mocking behavior (api failures/successes)
class MockDogImageRepo extends Mock implements DogImageRepo {}