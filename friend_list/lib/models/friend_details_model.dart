import 'dart:convert';

class FrindDetailsModel {
  final int id;
  final String img;
  final String firstName;
  final String lastName;
  final String phone;
  final String address_1;
  final String city;
  final String state;
  final String zipcode;
  final String bio;
  final List<String> photos;
  final List<String> statuses;
  final bool available;
  FrindDetailsModel({
    required this.id,
    required this.img,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address_1,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.bio,
    required this.photos,
    required this.statuses,
    required this.available,
  });

  factory FrindDetailsModel.fromJson(final String source) =>
      FrindDetailsModel.fromMap(json.decode(source));

  factory FrindDetailsModel.fromMap(final Map<String, dynamic> map) {
    return FrindDetailsModel(
      id: map['id']?.toInt() ?? 0,
      img: map['img'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      phone: map['phone'] ?? '',
      address_1: map['address_1'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      zipcode: map['zipcode'] ?? '',
      bio: map['bio'] ?? '',
      photos: List<String>.from(map['photos']),
      statuses: List<String>.from(map['statuses']),
      available: map['available'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'img': img});
    result.addAll({'first_name': firstName});
    result.addAll({'last_name': lastName});
    result.addAll({'phone': phone});
    result.addAll({'address_1': address_1});
    result.addAll({'city': city});
    result.addAll({'state': state});
    result.addAll({'zipcode': zipcode});
    result.addAll({'bio': bio});
    result.addAll({'photos': photos});
    result.addAll({'statuses': statuses});
    result.addAll({'available': available});

    return result;
  }
}

// { 
//     "id": 6, 
//     "img": "https://s3.amazonaws.com/uifaces/faces/twitter/walterstephanie/128.jpg", 
//     "first_name": "Steph",
//     "last_name": "Walters",
//     "phone": "(820) 289-1818",
//     "address_1": "5190 Center Court Drive",
//     "city": "Spring",
//     "state": "TX",
//     "zipcode": "77370",
//     "bio": "I'm very choosy. I'm also very suspicious, very irrational and I have a very short temper. I'm also extremely jealous and slow to forgive. Just so you know.",
//     "photos":[
//         "https://flic.kr/p/mxHVJu",
//         "https://flic.kr/p/nCJyXN",
//         "https://flic.kr/p/mxwwsv"
//     ],
//     "statuses": [
//         "Developing something amazing",
//         "This could be interesting....",
//         "Man, life is so good",
//         "There is nothing quite like a good friend",
//         "Take a look around you, everything is awesome",
//         "What is the point of all of this"
//     ],
//     "available": true
// }