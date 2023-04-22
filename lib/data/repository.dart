import 'package:game_of_thrones/data/models.dart';
import 'package:game_of_thrones/data/webService.dart';

class Repository {
  final WebService webService;

  Repository({required this.webService});
  Future<List<Character>> getCharacters() async {
    final modles = await webService.getCharacters();
    return modles!.map((character) => Character.fromJson(character)).toList();
  }
}
