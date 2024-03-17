import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

part 'userdata.g.dart';

@HiveType(typeId: 2)
class UserData {
  UserData({
    required this.userEmail,
  });

  @HiveField(0)
  String userEmail;
}
