import 'package:facebook_ui_mockup/config/paletter.dart';
import 'package:facebook_ui_mockup/data/data.dart';
import 'package:facebook_ui_mockup/models/post_model.dart';
import 'package:facebook_ui_mockup/widgets/create_posts.dart';
import 'package:facebook_ui_mockup/widgets/post_container.dart';
import 'package:facebook_ui_mockup/widgets/rooms.dart';
import 'package:facebook_ui_mockup/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            centerTitle: false,
            actions: [
              _BuildIcon(Colors.black, Icons.search),
              _BuildIcon(Colors.black, MdiIcons.facebookMessenger)
            ],
          ),
          SliverToBoxAdapter(child: CreatePosts(currentUser: currentUser)),
          SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              sliver:
                  SliverToBoxAdapter(child: Rooms(onlineUsers: onlineUsers))),
          SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              sliver: SliverToBoxAdapter(
                child: Stories(currentUser: currentUser, stories: stories),
              )),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ))
        ],
      ),
    );
  }
}

Widget _BuildIcon(Color color, IconData icon) {
  return Container(
    margin: EdgeInsets.all(6),
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
    child: IconButton(
        icon: Icon(icon), iconSize: 30, color: color, onPressed: () {}),
  );
}
