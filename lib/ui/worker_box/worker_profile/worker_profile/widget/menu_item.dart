import 'package:flutter/material.dart';
import 'package:open_work/utils/color.dart';

class ProfileItem extends StatelessWidget {
  ProfileItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.color,
  });
  IconData icon;
  String text;
  VoidCallback onTap;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.neutral7,
          ),
          child: Center(
              child: Icon(
            icon,
            color: color,
          )),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: MyColors.neutral5,
        ),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
