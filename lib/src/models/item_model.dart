import 'dart:convert';

class ItemModel {
  late final String id;
  late final String title;
  late final String description;
  late final String url;
  late final String author;
  late final String image;
  late final String language;
  late final List<String> category;
  late final String published;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        title = parsedJson['title'],
        description = parsedJson['description'],
        url = parsedJson['url'],
        image = parsedJson['image'],
        language = parsedJson['language'],
        category = parsedJson['category'] ?? [],
        published = parsedJson['published'];
}
