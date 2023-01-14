
import 'package:equatable/equatable.dart';

//Equatable is how we determine if two objects are equal to one-another.
abstract class DogImageState extends Equatable {}

class DogImageInitialState extends DogImageState {
  @override
  List<Object?> get props => [];
}

class DogImageErrorState extends DogImageState {
  @override
  List<Object?> get props => [];
}

class DogImageLoadingState extends DogImageState {
  @override
  List<Object?> get props => [];
}

class DogImageLoadedState extends DogImageState {
  final String imageUrl;

  DogImageLoadedState({
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
    imageUrl,
  ];
}