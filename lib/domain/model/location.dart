import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

const String locationBoxName = 'locationBox';

@JsonSerializable()
@HiveType(typeId: 0)
class Location extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String address;

  @HiveField(4)
  final double lat;

  @HiveField(5)
  final double lng;

  @HiveField(6)
  final int rating;

  @HiveField(7)
  final String imageUrl;

  @HiveField(8)
  bool isFavorite;

  Location(
    this.id,
    this.title,
    this.description,
    this.address,
    this.lat,
    this.lng,
    this.rating,
    this.imageUrl, {
    this.isFavorite = false,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  bool operator ==(Object other) =>
      other is Location && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
