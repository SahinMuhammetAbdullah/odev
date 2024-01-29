class User {
  final String id;
  final String email;
  final String displayName;
  final String profileImageUrl;

  User({
    required this.id,
    required this.email,
    required this.displayName,
    required this.profileImageUrl,
  });

  factory User.fromMap(Map<String, dynamic> data, String documentId) {
    return User(
      id: documentId,
      email: data['email'] ?? '',
      displayName: data['displayName'] ?? '',
      profileImageUrl: data['profileImageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'profileImageUrl': profileImageUrl,
    };
  }
}
