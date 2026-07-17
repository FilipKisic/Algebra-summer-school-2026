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

  Location(
    this.id,
    this.title,
    this.description,
    this.address,
    this.lat,
    this.lng,
    this.rating,
    this.imageUrl,
  );

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
