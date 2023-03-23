abstract class SkillAddEvent {}

class AddSkillEvent extends SkillAddEvent {
  int id;
  AddSkillEvent({required this.id});
}
