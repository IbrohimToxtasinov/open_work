import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/bloc/skill_add/skill_add_bloc.dart';
import 'package:open_work/bloc/skill_add/skill_add_event.dart';
import 'package:open_work/bloc/skill_add/skill_add_state.dart';
import 'package:open_work/data/models/form_status/form_status.dart';
import 'package:open_work/data/models/skill/skill_model.dart';
import 'package:open_work/ui/widgets/my_appbar.dart';
import 'package:open_work/utils/my_utils.dart';

class AddSkillsScreen extends StatelessWidget {
  AddSkillsScreen({super.key, required this.skills});
  List<SkillModel> skills;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SkillAddBloc(),
      child: BlocListener<SkillAddBloc, SkillAddState>(
        listener: (context, state) {
          if (state.status == FormStatus.success) {
            MyUtils.getMyToast(message: "Skill added");
          }
          if (state.status == FormStatus.failure) {
            MyUtils.getMyToast(message: state.errorMessage);
          }
        },
        child: Scaffold(
          appBar: const MyAppBar(
            title: 'Add Skills',
          ),
          body: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                    trailing: TextButton(
                      onPressed: () => BlocProvider.of<SkillAddBloc>(context)
                          .add(AddSkillEvent(id: skills[index].id)),
                      child: const Text("Add Skill"),
                    ),
                    title: Text(skills[index].name));
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                    child: Divider(),
                  ),
              itemCount: skills.length),
        ),
      ),
    );
  }
}
