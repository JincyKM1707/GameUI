class Design {
  final int id;
  final String name;
  final String url;
  final String season;
  final String type;
  final String number;
  final String airdate;
  final String summary;
  Design({
    required this.name,
    required this.id,
    required this.url,
    required this.season,
    required this.type,
    required this.number,
    required this.airdate,
    required this.summary,
  });
  factory Design.fromJSon(Map<String, dynamic> json) {
    return Design(
      name: json['name'],
      id: json['id'],
      url: json['image']['medium'],
      season: json['season'],
      type: json['type'],
      number: json['number'],
      airdate: json['airdate'],
      summary: json['summary'],
    );
  }
}
