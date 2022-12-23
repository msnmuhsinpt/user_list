import 'package:hive/hive.dart';
import 'package:userlist/db/hive/model/hive_db.dart';

class Boxes {
  static Box<User> getData() => Hive.box<User>('user');
}
