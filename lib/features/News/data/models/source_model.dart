class SourceModel {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;
  const SourceModel(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});
  SourceModel copyWith(
      {String? id,
      String? name,
      String? description,
      String? url,
      String? category,
      String? language,
      String? country}) {
    return SourceModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        url: url ?? this.url,
        category: category ?? this.category,
        language: language ?? this.language,
        country: country ?? this.country);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'url': url,
      'category': category,
      'language': language,
      'country': country
    };
  }

  static SourceModel fromJson(Map<String, Object?> json) {
    return SourceModel(
        id: json['id'] == null ? null : json['id'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        url: json['url'] == null ? null : json['url'] as String,
        category: json['category'] == null ? null : json['category'] as String,
        language: json['language'] == null ? null : json['language'] as String,
        country: json['country'] == null ? null : json['country'] as String);
  }

  @override
  String toString() {
    return '''SourceModel(
                id:$id,
name:$name,
description:$description,
url:$url,
category:$category,
language:$language,
country:$country
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SourceModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.url == url &&
        other.category == category &&
        other.language == language &&
        other.country == country;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, name, description, url, category, language, country);
  }
}
