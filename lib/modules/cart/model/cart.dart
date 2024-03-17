import 'package:hive/hive.dart';

part 'cart.g.dart';

@HiveType(typeId: 1)
class Cart {
  Cart({
    required this.name,
    required this.id,
    required this.image,
    required this.price,
    required this.quantity,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  int id;

  @HiveField(2)
  String image;

  @HiveField(3)
  double price;
  @HiveField(4)
  int quantity;
}
