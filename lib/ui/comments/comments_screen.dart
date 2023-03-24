import 'package:flutter/material.dart';
import 'package:open_work/ui/widgets/single_icon_appbar.dart';
import 'package:open_work/utils/icons/app_icons.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SingleIconAppBar(
        onTap: () {},
        title: 'Comments',
        svgIcon: AppIcons.addCommentIcon,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
