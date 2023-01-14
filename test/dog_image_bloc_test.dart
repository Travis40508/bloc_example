import 'package:bloc_example_tutorial/screens/bloc/dog_image_bloc.dart';
import 'package:bloc_example_tutorial/screens/bloc/dog_image_events.dart';
import 'package:bloc_example_tutorial/screens/bloc/dog_image_states.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks.dart';

/// Testing our assumptions about our bloc.
void main() {
  final repo = MockDogImageRepo();
  blocTest(
    'On Error',
    build: () => DogImageBloc(repository: repo),
    setUp: () {
      when(() => repo.fetchRandomDogImage()).thenThrow(Error());
    },
    act: (bloc) {
      bloc.add(FetchDogImage());
    },
    expect: () => [
      isA<DogImageLoadingState>(),
      isA<DogImageErrorState>(),
    ],
  );

  blocTest(
    'On Success',
    build: () => DogImageBloc(repository: repo),
    setUp: () {
      when(() => repo.fetchRandomDogImage())
          .thenAnswer((_) => Future.value('testResponse'));
    },
    act: (bloc) {
      bloc.add(FetchDogImage());
    },
    expect: () => [
      isA<DogImageLoadingState>(),
      // having is nice because it allows us to determine WHICH (if any)
      // variables we want to check against (rather than all of them, if you
      // just use a constructor like we were before).
      isA<DogImageLoadedState>().having(
        (state) => state.imageUrl,
        'has correct value for imageUrl',
        'testResponse',
      )
    ],
  );
}
