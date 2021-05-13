import 'package:facebook_ui_mockup/models/models.dart';
import 'package:flutter/material.dart';

class Post {
  final User user;
  final String caption;
  final String timeAgo;
  final String imageUrl;
  final int likes;
  final int shares;
  final int comments;

  Post(
      {@required this.user,
      @required this.caption,
      @required this.timeAgo,
      @required this.imageUrl,
      @required this.likes,
      @required this.shares,
      @required this.comments});
}
