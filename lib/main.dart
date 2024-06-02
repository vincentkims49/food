import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/hive/food_item_hive.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/food_list_screen.dart';
import 'package:provider/provider.dart';

import 'store/foodstore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FoodItemHiveAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FoodStore store = FoodStore();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FoodStore>(create: (_) => store),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const FoodListScreen(),
        routes: {
          '/cart': (context) => const CartScreen(),
          '/checkout': (context) => const CheckoutScreen(),
          '/foodlist': (context) => const FoodListScreen(),
        },
      ),
    );
  }
}
