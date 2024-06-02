// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:isar/isar.dart';
import '../models/food_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

import '../models/isar/food_item_isar.dart';

part 'foodstore.g.dart';

class FoodStore = _FoodStore with _$FoodStore;

abstract class _FoodStore with Store {
  late Isar isar;

  @observable
  ObservableList<FoodItem> foodItems = ObservableList<FoodItem>();

  @observable
  ObservableList<FoodItem> cartItems = ObservableList<FoodItem>();

  _FoodStore() {
    initIsar();
  }

  Future<void> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([FoodItemIsarSchema], directory: dir.path);
  }

  @action
  Future<void> fetchFoodItems() async {
    final String apiKey = 'YOUR_API_KEY';
    try {
      final response = await http.get(Uri.parse(
          'https://api.spoonacular.com/food/wine/recommendation?wine=merlot&maxPrice=50&minRating=0.7&number=10&apiKey=$apiKey'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['recommendedWines'] as List;
        final fetchedFoodItems =
            data.map((json) => FoodItem.fromJson(json)).toList();
        foodItems = ObservableList.of(fetchedFoodItems);

        // Store fetched food items locally in Isar
        await isar.writeTxn(() async {
          for (var item in fetchedFoodItems) {
            final isarItem = FoodItemIsar.fromFoodItem(item);
            await isar.foodItemIsars.put(isarItem);
          }
        });
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }

  @action
  void addToCart(FoodItem item) {
    cartItems.add(item);
  }

  @action
  void removeFromCart(FoodItem item) {
    cartItems.remove(item);
  }

  @action
  Future<void> checkout() async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://jsonplaceholder.typicode.com/posts'), // Dummy endpoint
        headers: {'Content-Type': 'application/json'},
        body: json.encode(cartItems.map((item) => item.toJson()).toList()),
      );

      if (response.statusCode == 201) {
        cartItems.clear();
      } else {
        throw Exception(
            'Checkout failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Checkout failed: $e');
    }
  }

  @action
  Future<void> clearFoodItems() async {
    await isar.writeTxn(() async {
      await isar.foodItemIsars.clear();
    });
    foodItems.clear();
  }
}
