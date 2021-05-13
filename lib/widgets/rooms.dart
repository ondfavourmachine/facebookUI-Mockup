import 'package:facebook_ui_mockup/config/paletter.dart';
import 'package:facebook_ui_mockup/models/models.dart';
import 'package:facebook_ui_mockup/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  Rooms({@required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        // color: Colors.orange,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _CreateRoomButton(),
                );
              }
              final User user = onlineUsers[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            }));
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        borderSide: BorderSide(width: 3, color: Colors.blueAccent[100]),
        child: Row(
          children: [
            ShaderMask(
              shaderCallback: (rect) =>
                  Palette.createRoomGradient.createShader(rect),
              child: IconButton(
                  color: Colors.white,
                  iconSize: 30,
                  icon: Icon(Icons.video_call),
                  onPressed: () {}),
            ),
            Text(
              'Create\nRoom',
              style: TextStyle(
                color: Palette.facebookBlue,
              ),
            )
          ],
        ),
        onPressed: () {});
  }
}
