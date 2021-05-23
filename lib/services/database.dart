import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_functions';
// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:cmj_flutter_app/src/models/event.dart';
// import 'package:cmj_flutter_app/src/models/user.dart';
import 'package:Date_Roulette/models/profile.dart';
import 'package:flutter/material.dart';

final databaseReference = FirebaseFirestore.instance;
// CloudFunctions cloudFunctionsReference = CloudFunctions.instance;
CollectionReference users = databaseReference.collection('users');

abstract class Database {
  Stream getProfileStream();
  // Stream getProfileCF();
  // Stream getTeamsStream();
  // Stream getTeamsCF();
  Future<void> updateProfile(Profile profile);
  // Future<HttpsCallableResult> updateProfileCF(Profile profile);

  // Future<void> updateNotifications(Profile profile);

  // Future<void> createEvent(Event event);
  // Future<HttpsCallableResult> createEventCF(Event event);
  // Future<void> deleteEvent(Event event);
  // Stream<Event> getEventStream({@required String eventId});
}

class DatabaseService implements Database {
  DatabaseService({@required this.uid});

  final String uid;

  Stream getProfileStream() {
    Stream profileStream = users.doc(uid).snapshots();
    return profileStream;
  }

  // Stream getProfileCF() {
  //   HttpsCallable callable = cloudFunctionsReference.getHttpsCallable(
  //       functionName: "profile-getProfile");
  //   final results = callable.call(<String, dynamic>{
  //     'uid': uid,
  //   });
  //   return results as Stream;
  // }

  // Stream getTeamsStream() {
  //   Stream profileStream =
  //       users.doc(uid).snapshots(); //.collection('teams').snapshots();
  //   return profileStream;
  // }

  // Stream getTeamsCF() {
  //   HttpsCallable callable = cloudFunctionsReference.getHttpsCallable(
  //       functionName: "teams-getTeams");
  //   final results = callable.call(<String, dynamic>{
  //     'uid': uid,
  //   });
  //   return results as Stream;
  // }

  // Future<HttpsCallableResult> updateProfileCF(Profile profile) {
  //   HttpsCallable callable = cloudFunctionsReference.getHttpsCallable(
  //       functionName: "profile-setProfile");

  //   return callable.call(profile.toMap());
  // }

  Future<void> updateProfile(Profile profile) async {
    return users
        .doc(uid)
        .set(profile.toMap())
        .then((value) => print("Profile updated"))
        .catchError((error) => print("Failed to update profile: $error"));
  }

  // Future<void> createEvent(Event event) async {
  //   // TODO: implement deleteEvent
  //   throw UnimplementedError();
  // }

  // Future<HttpsCallableResult> createEventCF(Event event) {
  //   HttpsCallable callable = cloudFunctionsReference.getHttpsCallable(
  //     functionName: "events-addNew_events",
  //   );

  //   return callable.call(event.toMap());
  // }

  // Future<void> deleteEvent(Event event) {
  //   // TODO: implement deleteEvent
  //   throw UnimplementedError();
  // }

  // Stream<Event> getEventStream({String eventId}) {
  //   // TODO: implement eventStream
  //   throw UnimplementedError();
  // }
}
