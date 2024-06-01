class CategoryModel {
  final String image;
  final String name;
  final List<TouristPlaceModel> touristPlaces;

  CategoryModel({
    required this.image,
    required this.name,
    required this.touristPlaces,
  });
}

class TouristPlaceModel {
  final String name;
  final String image;
  final List<AttractionsModel> attractions;

  TouristPlaceModel({
    required this.image,
    required this.name,
    required this.attractions,
  });
}

class AttractionsModel {
  final String? name;
  final String image;
  final String? details;
  final List<String>? images3d;

  AttractionsModel({
    required this.image,
     this.name,
    this.details,
    this.images3d,
  });
}
