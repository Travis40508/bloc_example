import 'dart:convert';

import 'package:http/http.dart' show Client;

/// Makes actual API call.
class DogImageService {
  final _client = Client();

  Future<String> fetchRandomDogImage() async {
    final response = await _client.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    final json = response.body;
    final jsonDecoded = jsonDecode(json);

    // Returns image url.
    return jsonDecoded['message'];
  }
}