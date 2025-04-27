class Design {
  final int id;
  final String name;
  final int season;
  final int number;
  final String summary;
  final String imageUrl;
  final String airdate;
  Design({
    required this.id,
    required this.name,
    required this.season,
    required this.number,
    required this.summary,
    required this.imageUrl,
    required this.airdate,
  });
  factory Design.fromJSon(Map<String, dynamic> json) {
    return Design(
      id: json['id'],
      name: json['name'],
      season: json['season'],
      number: json['number'],
      summary: json['summary'] ?? '',
      imageUrl: json['image'] != null ? json['image']['medium'] ?? '' : '',
      airdate: json['airdate'] ?? '',
    );
  }
}
