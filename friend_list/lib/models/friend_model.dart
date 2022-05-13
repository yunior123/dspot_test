class FriendModel {
  final String imageUrl;
  final int id;
  final String status;
  final String firstName;
  final String lastName;
  final bool available;
  FriendModel({
    required this.imageUrl,
    required this.id,
    required this.status,
    required this.firstName,
    required this.lastName,
    required this.available,
  });

  factory FriendModel.fromMap(final Map<String, dynamic> map) {
    return FriendModel(
      imageUrl: map['img'] ?? '',
      id: map['id'] ?? '',
      status: map['status'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      available: map['available'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'img': imageUrl});
    result.addAll({'id': id});
    result.addAll({'status': status});
    result.addAll({'first_name': firstName});
    result.addAll({'last_name': lastName});
    result.addAll({'available': available});

    return result;
  }
}
