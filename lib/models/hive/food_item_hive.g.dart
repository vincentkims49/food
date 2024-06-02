// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodItemHiveAdapter extends TypeAdapter<FoodItemHive> {
  @override
  final int typeId = 0;

  @override
  FoodItemHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodItemHive(
      id: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      price: fields[3] as String,
      imageUrl: fields[4] as String,
      averageRating: fields[5] as double,
      ratingCount: fields[6] as int,
      score: fields[7] as double,
      link: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FoodItemHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.averageRating)
      ..writeByte(6)
      ..write(obj.ratingCount)
      ..writeByte(7)
      ..write(obj.score)
      ..writeByte(8)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodItemHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
