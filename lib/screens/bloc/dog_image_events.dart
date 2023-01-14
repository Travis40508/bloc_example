
import 'package:equatable/equatable.dart';

/// Events on the app (such as tapping a button, scrolling, etc.)
abstract class DogImageEvent extends Equatable {}

class FetchDogImage extends DogImageEvent {
  @override
  List<Object?> get props => [];
}