import 'package:isar/isar.dart';
part 'user_entity_isar.g.dart';

@collection
class UserEntity {
  Id id = Isar.autoIncrement;
  String? name;
  String? pin;
  List<byte>? imageUrl;
}
