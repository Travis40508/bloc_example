import 'package:bloc_example_tutorial/repository/dog_image_repo.dart';
import 'package:bloc_example_tutorial/repository/dog_image_service.dart';
import 'package:bloc_example_tutorial/screens/dog_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main () => runApp(const DogImageApp());


class DogImageApp extends StatelessWidget {
  const DogImageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provides the repository throughout the whole app at the top of the parent
    // tree. This way no matter how many screens there are, we'll always have
    // access to this repository.
    return RepositoryProvider(
      create: (_) => DogImageRepo(service: DogImageService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/dogImageScreen': (_) => const DogImageScreen(),
        },
        initialRoute: '/dogImageScreen',
      ),
    );
  }
}
