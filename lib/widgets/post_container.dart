import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui_mockup/config/paletter.dart';
import 'package:facebook_ui_mockup/models/post_model.dart';
import 'package:facebook_ui_mockup/widgets/profile_avatar.dart';
import 'package:facebook_ui_mockup/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  PostContainer({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: isDesktop ? 5 : 0, vertical: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
          : null,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(vertical: 8),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _PostHeader(post: post),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(post.caption),
                    post.imageUrl != null
                        ? const SizedBox.shrink()
                        : SizedBox(
                            height: 6,
                          )
                  ],
                ),
              ),
              post.imageUrl != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CachedNetworkImage(imageUrl: post.imageUrl),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _PostStats(post: post),
              )
            ],
          )),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  _PostHeader({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${post.user.name}',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} . ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey[600],
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_horiz),
          color: Colors.grey[600],
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  _PostStats({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext build) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey[600]),
            )
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButtons(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey[700],
                  size: 20,
                ),
                label: 'Like',
                onTap: () => print('pressed')),
            _PostButtons(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[700],
                  size: 20,
                ),
                label: 'Comments',
                onTap: () => print('pressed')),
            _PostButtons(
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey[700],
                  size: 20,
                ),
                label: 'Shares',
                onTap: () => print('pressed')),
          ],
        )
      ],
    );
  }
}

class _PostButtons extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;
  _PostButtons(
      {Key key,
      @required this.icon,
      @required this.label,
      @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
            onTap: onTap,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [icon, const SizedBox(width: 4), Text(label)],
                ))),
      ),
    );
  }
}
