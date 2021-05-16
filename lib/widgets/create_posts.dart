import 'package:facebook_ui_mockup/models/models.dart';
import 'package:facebook_ui_mockup/widgets/profile_avatar.dart';
import 'package:facebook_ui_mockup/widgets/responsive.dart';
import 'package:flutter/material.dart';

class CreatePosts extends StatelessWidget {
  final User currentUser;

  CreatePosts({@required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  ProfileAvatar(imageUrl: currentUser.imageUrl),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'What is on your mind...')),
                  )
                ],
              ),
              const Divider(
                height: 10,
                thickness: 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildAWidgetTextButton(() {
                    print('Live');
                  }, Icons.videocam, Colors.red, Text('Live')),
                  const VerticalDivider(width: 8),
                  buildAWidgetTextButton(() {
                    print('Live');
                  }, Icons.photo_library, Colors.green, Text('Photo')),
                  const VerticalDivider(width: 8),
                  buildAWidgetTextButton(() {
                    print('Live');
                  }, Icons.video_call, Colors.purple, Text('Room'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

TextButton buildAWidgetTextButton(
    Function func, IconData icon, Color color, Text text) {
  return TextButton.icon(
      onPressed: func,
      icon: Icon(
        icon,
        color: color,
      ),
      label: text);
}
