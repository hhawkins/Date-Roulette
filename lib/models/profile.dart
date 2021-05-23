import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class Profile {
  Profile(
      {@required this.name,
      @required this.email,
      @required this.location,
      @required this.dateOfBirth,
      @required this.phoneNumber,
      @required this.profilePicture});

  final String name;
  final String email;
  final String location;
  final String dateOfBirth;
  final String phoneNumber;
  final String profilePicture;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'location': location,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  factory Profile.fromJson(dynamic json) {
    return Profile(
      name: json['name'] as String,
      email: json['email'] as String,
      location: json['location'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profilePicture: json['profilePicture'] as String,
    );
  }

  factory Profile.fromMap(Map data) {
    return Profile(
      name: data['name'] as String,
      email: data['email'] as String,
      location: data['location'] as String,
      dateOfBirth: data['dateOfBirth'] as String,
      phoneNumber: data['phoneNumber'] as String,
      profilePicture: data['profilePicture'] as String,
    );
  }

  factory Profile.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Profile(
      name: data['name'] as String,
      email: data['email'] as String,
      location: data['location'] as String,
      dateOfBirth: data['dateOfBirth'] as String,
      phoneNumber: data['phoneNumber'] as String,
      profilePicture: data['profilePicture'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.email} }';
  }
}
