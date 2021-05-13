import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui_mockup/config/paletter.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final bool isActive;
  final String imageUrl;
  final bool hasBorder;

  const ProfileAvatar(
      {this.isActive = false, @required this.imageUrl, this.hasBorder = false});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Palette.facebookBlue,
        child: CircleAvatar(
          radius: hasBorder ? 17 : 20,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(this.imageUrl),
        ),
      ),
      isActive
          ? Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.white),
                    shape: BoxShape.circle,
                    color: Palette.online),
              ))
          : const SizedBox.shrink()
    ]);
  }
}
