import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui_mockup/config/paletter.dart';
import 'package:facebook_ui_mockup/models/models.dart';
import 'package:facebook_ui_mockup/models/user_model.dart';
import 'package:facebook_ui_mockup/widgets/profile_avatar.dart';
import 'package:facebook_ui_mockup/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  Stories({@required this.currentUser, @required this.stories});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _StoryCard(
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            }
            final Story story = stories[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _StoryCard(
                story: story,
              ),
            );
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final User currentUser;
  final Story story;
  final bool isAddStory;

  const _StoryCard(
      {Key key, this.currentUser, this.story, this.isAddStory = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
              height: double.infinity,
              width: 110,
              fit: BoxFit.cover,
              imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
              boxShadow: Responsive.isDesktop(context)
                  ? const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4),
                    ]
                  : null,
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12)),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: isAddStory
                ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      color: Palette.facebookBlue,
                      iconSize: 30,
                      icon: Icon(Icons.add),
                      onPressed: () => print(''),
                    ),
                  )
                : ProfileAvatar(
                    imageUrl: story.imageUrl,
                    hasBorder: true,
                  )),
        Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Text(
              isAddStory ? 'Add to story' : story.user.name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ))
      ],
    );
  }
}
