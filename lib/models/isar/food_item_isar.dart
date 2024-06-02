import 'package:isar/isar.dart';

import '../food_item.dart';

part 'food_item_isar.g.dart';

@collection
class FoodItemIsar {
  Id id = Isar.autoIncrement;

  late int foodItemId;
  late String title;
  late String description;
  late String price;
  late String imageUrl;
  late double averageRating;
  late int ratingCount;
  late double score;
  late String link;

  FoodItemIsar();

  factory FoodItemIsar.fromFoodItem(FoodItem item) {
    return FoodItemIsar()
      ..foodItemId = item.id
      ..title = item.title
      ..description = item.description
      ..price = item.price
      ..imageUrl = item.imageUrl
      ..averageRating = item.averageRating
      ..ratingCount = item.ratingCount
      ..score = item.score
      ..link = item.link;
  }

  FoodItem toFoodItem() {
    return FoodItem(
      id: foodItemId,
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
