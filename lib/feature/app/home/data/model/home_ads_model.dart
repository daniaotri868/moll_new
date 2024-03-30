import 'package:faker/faker.dart';

class HomeAdsModel {
  final String id;
  final String title;
  final String url;

  HomeAdsModel({
    required this.id,
    required this.title,
    required this.url,
  });

  factory HomeAdsModel.fromJson(Map<String, dynamic> json) {
    return HomeAdsModel(
      url: json["url"],
      id: json["id"],
      title: json["title"],
    );
  }

  static List<HomeAdsModel> fakeData() {
    return [
      HomeAdsModel(
        id: "1",
        title: "ad 1",
        url: faker.image.image(random: true),
      ),
      HomeAdsModel(
        id: "2",
        title: "ad 2",
        url: faker.image.image(random: true),
      ),
      HomeAdsModel(
        id: "3",
        title: "ad 3",
        url: faker.image.image(random: true),
      ),
    ];
  }
}
