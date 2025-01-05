// ignore_for_file: file_names

class Inf {
  final String author;
  final String title;
  final String url;
  final String urlToImage;
  final bool isActive;

  const Inf({
    required this.author,
    required this.title,
    required this.url,
    required this.urlToImage,
    this.isActive = true,
  });

  factory Inf.fromJson(Map<String, dynamic> item) {
    return Inf(
      author: item['author'] as String? ?? '',
      title: item['title'] as String? ?? '',
      url: item['url'] as String? ?? '',
      urlToImage: item['urlToImage'] as String? ?? '',
      isActive: item['isActive'] as bool? ?? true,
    );
  }
}

List<Inf> getInf = [];
