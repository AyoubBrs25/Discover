
import 'package:discover/secondry/hotels.dart';
import 'package:discover/secondry/restaurant.dart';

class PlacesCnstr {
  final int id;
  final String name;
  final String location;
  bool? fav;
  final String diriction;
  final String type;
  final List<String> picturs;
  final List<hotel> hotels;
  final List<restaurant> restaurants;
  final String desc;

  PlacesCnstr (this.id,this.name,this.location,this.fav,this.type,this.diriction,this.desc,this.picturs,this.hotels,this.restaurants);

}