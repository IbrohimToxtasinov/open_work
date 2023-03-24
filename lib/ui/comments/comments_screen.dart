import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/ui/comments/widgets/comment_item.dart';
import 'package:open_work/ui/widgets/single_icon_appbar.dart';
import 'package:open_work/utils/constants.dart';
import 'package:open_work/utils/icons/app_icons.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SingleIconAppBar(
        onTap: () {
          Navigator.pushNamed(context, addCommentScreen);
        },
        title: 'Reviews',
        svgIcon: AppIcons.addCommentIcon,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24).w,
        child: ListView.builder(
          itemCount: 20,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return const CommentItem(
              name: "Ibrohim",
              surname: "Toxtasinov",
              comment:
                  "Zo'r gap yo'qcjkenedcnasbck,QBCDqefEBFWEUFAWEFBEUFEWFWEFWEGFEWGToxtasinovToxtasinovToxtasinovToxtasinovToxtasinovToxtasinovToxtasinovToxtasinovToxtasinov",
              online: "December 16, 2022",
              // online: DateFormat.yMMMMd()
              //     .format(DateTime.parse())
              //     .toString(),
            );
          },
        ),
      ),
    );
  }
}
