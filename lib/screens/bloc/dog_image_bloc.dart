

import 'package:bloc_example_tutorial/repository/dog_image_repo.dart';
import 'package:bloc_example_tutorial/screens/bloc/dog_image_events.dart';
import 'package:bloc_example_tutorial/screens/bloc/dog_image_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Bloc
class DogImageBloc extends Bloc<DogImageEvent, DogImageState> {
  final DogImageRepo repository;

  DogImageBloc({required this.repository}) : super(DogImageInitialState()) {
    on<FetchDogImage>((event, emit) async {
      emit(DogImageLoadingState());
      try {
        final dogImage = await repository.fetchRandomDogImage();
        emit(DogImageLoadedState(imageUrl: dogImage));
      } catch(e) {
        emit(DogImageErrorState());
      }
    });
  }
}