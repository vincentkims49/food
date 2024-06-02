import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

@freezed
class FoodItem with _$FoodItem {
  factory FoodItem({
    required int id,
    required String title,
    required String description,
    required String price,
    required String imageUrl,
    required double averageRating,
    required int ratingCount,
    required double score,
    required String link,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);
}
