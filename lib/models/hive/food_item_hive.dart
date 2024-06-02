import 'package:hive/hive.dart';
import '../food_item.dart';

part 'food_item_hive.g.dart';

@HiveType(typeId: 0)
class FoodItemHive extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String price;
  @HiveField(4)
  String imageUrl;
  @HiveField(5)
  double averageRating;
  @HiveField(6)
  int ratingCount;
  @HiveField(7)
  double score;
  @HiveField(8)
  String link;

  FoodItemHive({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.averageRating,
    required this.ratingCount,
    required this.score,
    required this.link,
  });

  factory FoodItemHive.fromFoodItem(FoodItem item) {
    return FoodItemHive(
      id: item.id,
      title: item.title,
      description: item.description,
      price: item.price,
      imageUrl: item.imageUrl,
      averageRating: item.averageRating,
      ratingCount: item.ratingCount,
      score: item.score,
      link: item.link,
    );
  }

  FoodItem toFoodItem() {
    return FoodItem(
      id: id,
      title: title,
      description: description,
      price: price,
      imageUrl: imageUrl,
      averageRating: averageRating,
      ratingCount: ratingCount,
      score: score,
      link: link,
    );
  }
}
