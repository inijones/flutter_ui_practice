class Messages {
  String id;
  String name;
  String profileImageURL;
  String text;
  String timestamp;

  Messages({
    required this.id,
    required this.name,
    required this.profileImageURL,
    required this.text,
    required this.timestamp,
  });

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      profileImageURL: json['profileImageURL'] ?? '',
      text: json['text'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }
}
