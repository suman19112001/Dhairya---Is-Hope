class Aticles {
  Aticles({
    required this.article,
    required this.message,
  });
  late final List<Article> article;
  late final String message;

  Aticles.fromJson(Map<String, dynamic> json) {
    article =
        List.from(json['article']).map((e) => Article.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['article'] = article.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Article {
  Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.summary,
    required this.description,
    required this.coverImage,
    required this.articleArray,
  });
  late final String id;
  late final String title;
  late final String subtitle;
  late final String summary;
  late final String description;
  late final String coverImage;
  late final List<dynamic> articleArray;

  Article.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    summary = json['summary'];
    description = json['description'];
    coverImage = json['coverImage'];
    articleArray = List.castFrom<dynamic, dynamic>(json['articleArray']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['subtitle'] = subtitle;
    _data['summary'] = summary;
    _data['description'] = description;
    _data['coverImage'] = coverImage;
    _data['articleArray'] = articleArray;
    return _data;
  }
}
