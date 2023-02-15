import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class UserModel {
  final String name;
  final String email;
  final List<String> followers;
  final List<String> following;
  final String profilePicture;
  final String banarPicture;
  final String uid;
  final String bio;
  final bool isTwitterblue;
  const UserModel({
    required this.name,
    required this.email,
    required this.followers,
    required this.following,
    required this.profilePicture,
    required this.banarPicture,
    required this.uid,
    required this.bio,
    required this.isTwitterblue,
  });

  UserModel copyWith({
    String? name,
    String? email,
    List<String>? followers,
    List<String>? following,
    String? profilePicture,
    String? banarPicture,
    String? uid,
    String? bio,
    bool? isTwitterblue,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      profilePicture: profilePicture ?? this.profilePicture,
      banarPicture: banarPicture ?? this.banarPicture,
      uid: uid ?? this.uid,
      bio: bio ?? this.bio,
      isTwitterblue: isTwitterblue ?? this.isTwitterblue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'followers': followers,
      'following': following,
      'profilePicture': profilePicture,
      'banarPicture': banarPicture,
      'bio': bio,
      'isTwitterblue': isTwitterblue,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      followers: List<String>.from(map['followers']),
      following: List<String>.from(map['following']),
      profilePicture: map['profilePicture'] ?? '',
      banarPicture: map['banarPicture'] ?? '',
      uid: map['\$id'] ?? '',
      bio: map['bio'] ?? '',
      isTwitterblue: map['isTwitterblue'] ?? false,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, followers: $followers, following: $following, profilePicture: $profilePicture, banarPicture: $banarPicture, uid: $uid, bio: $bio, isTwitterblue: $isTwitterblue)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.email == email &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following) &&
        other.profilePicture == profilePicture &&
        other.banarPicture == banarPicture &&
        other.uid == uid &&
        other.bio == bio &&
        other.isTwitterblue == isTwitterblue;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        profilePicture.hashCode ^
        banarPicture.hashCode ^
        uid.hashCode ^
        bio.hashCode ^
        isTwitterblue.hashCode;
  }
}
