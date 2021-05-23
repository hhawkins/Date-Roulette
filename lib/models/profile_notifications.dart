import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class ProfileNotifications {
  ProfileNotifications(
      {@required this.enablePush,
      @required this.enableEmail,
      @required this.enableText,
      @required this.enableDiscountsAndPromotions,
      @required this.enableNewAndLiveEvents,
      @required this.enableNewFriends});

  final String enablePush;
  final String enableEmail;
  final String enableText;
  final String enableDiscountsAndPromotions;
  final String enableNewAndLiveEvents;
  final String enableNewFriends;

  Map<String, dynamic> toMap() {
    return {
      'enablePush': enablePush,
      'enableEmail': enableEmail,
      'enableText': enableText,
      'enableDiscountsAndPromotions': enableDiscountsAndPromotions,
      'enableNewAndLiveEvents': enableNewAndLiveEvents,
      'enableNewFriends': enableNewFriends,
    };
  }

  factory ProfileNotifications.fromJson(dynamic json) {
    return ProfileNotifications(
      enablePush: json['enablePush'] as String,
      enableEmail: json['enableEmail'] as String,
      enableText: json['enableText'] as String,
      enableDiscountsAndPromotions:
          json['enableDiscountsAndPromotions'] as String,
      enableNewAndLiveEvents: json['enableNewAndLiveEvents'] as String,
      enableNewFriends: json['enableNewFriends'] as String,
    );
  }

  factory ProfileNotifications.fromMap(Map data) {
    return ProfileNotifications(
      enablePush: data['enablePush'] as String,
      enableEmail: data['enableEmail'] as String,
      enableText: data['enableText'] as String,
      enableDiscountsAndPromotions:
          data['enableDiscountsAndPromotions'] as String,
      enableNewAndLiveEvents: data['enableNewAndLiveEvents'] as String,
      enableNewFriends: data['enableNewFriends'] as String,
    );
  }

  factory ProfileNotifications.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return ProfileNotifications(
      enablePush: data['enablePush'] as String,
      enableEmail: data['enableEmail'] as String,
      enableText: data['enableText'] as String,
      enableDiscountsAndPromotions:
          data['enableDiscountsAndPromotions'] as String,
      enableNewAndLiveEvents: data['enableNewAndLiveEvents'] as String,
      enableNewFriends: data['enableNewFriends'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.enablePush}, ${this.enableEmail} }';
  }
}
