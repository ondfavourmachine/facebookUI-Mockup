import 'package:facebook_ui_mockup/config/paletter.dart';
import 'package:facebook_ui_mockup/data/data.dart';
import 'package:facebook_ui_mockup/models/post_model.dart';
import 'package:facebook_ui_mockup/widgets/contacts_list.dart';
import 'package:facebook_ui_mockup/widgets/create_posts.dart';
import 'package:facebook_ui_mockup/widgets/more_options_list.dart';
import 'package:facebook_ui_mockup/widgets/post_container.dart';
import 'package:facebook_ui_mockup/widgets/responsive.dart';
import 'package:facebook_ui_mockup/widgets/rooms.dart';
import 'package:facebook_ui_mockup/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _tsc = TrackingScrollController();

  @override
  void dispose() {
    _tsc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Responsive(
              mobile: _HomeScreenMobile(scrollController: _tsc),
              desktop: _DesktopScreen(scrollController: _tsc))),
    );
  }
}

Widget BuildIcon(Color color, IconData icon) {
  return Container(
    margin: EdgeInsets.all(6),
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
    child: IconButton(
        icon: Icon(icon), iconSize: 30, color: color, onPressed: () {}),
  );
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenMobile({Key key, @required this.scrollController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
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
            BuildIcon(Colors.black, Icons.search),
            BuildIcon(Colors.black, MdiIcons.facebookMessenger)
          ],
        ),
        SliverToBoxAdapter(child: CreatePosts(currentUser: currentUser)),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(child: Rooms(onlineUsers: onlineUsers))),
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
    );
  }
}

class _DesktopScreen extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _DesktopScreen({Key key, @required this.scrollController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  sliver: SliverToBoxAdapter(
                    child: Stories(currentUser: currentUser, stories: stories),
                  )),
              SliverToBoxAdapter(child: CreatePosts(currentUser: currentUser)),
              SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  sliver: SliverToBoxAdapter(
                      child: Rooms(onlineUsers: onlineUsers))),
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
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        )
      ],
    );
  }
}
