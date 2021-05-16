import 'package:facebook_ui_mockup/config/paletter.dart';
import 'package:facebook_ui_mockup/models/user_model.dart';
import 'package:facebook_ui_mockup/widgets/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  final User currentUser;
  final List<List> _moreOptions = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];
  MoreOptionsList({@required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            constraints: BoxConstraints(maxHeight: 480),
            child: ListView.builder(
                itemCount: 1 + _moreOptions.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0)
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: UserCard(
                        user: currentUser,
                      ),
                    );

                  final List option = _moreOptions[index - 1];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: _Options(
                        icon: option[0], color: option[1], label: option[2]),
                  );
                })),
      ],
    );
  }
}

class _Options extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  _Options(
      {Key key,
      @required this.icon,
      @required this.color,
      @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => print(''),
        child: Row(
          children: [
            Icon(
              icon,
              size: 38,
              color: color,
            ),
            const SizedBox(
              width: 6,
            ),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
