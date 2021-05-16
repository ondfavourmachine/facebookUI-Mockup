import 'package:facebook_ui_mockup/config/paletter.dart';
import 'package:facebook_ui_mockup/models/user_model.dart';
import 'package:facebook_ui_mockup/screens/home_screen.dart';
import 'package:facebook_ui_mockup/widgets/custom_tabBar.dart';
import 'package:facebook_ui_mockup/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final List<IconData> icons;
  final User currentUser;
  final int selectedIndex;
  final Function(int) onTap;

  CustomAppBar(
      {Key key,
      @required this.icons,
      @required this.currentUser,
      @required this.selectedIndex,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: const [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                  fontSize: 32,
                  color: Palette.facebookBlue,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
          ),
          Container(
            width: 600,
            height: double.infinity,
            child: CustomTabBar(
                icons: icons,
                selectedIndex: selectedIndex,
                onTap: onTap,
                isBottomIndicator: true),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user: currentUser),
              const SizedBox(width: 12),
              BuildIcon(Colors.black, Icons.search),
              BuildIcon(Colors.black, MdiIcons.facebookMessenger)
            ],
          ))
        ],
      ),
    );
  }
}
