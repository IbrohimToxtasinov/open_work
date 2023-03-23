import 'package:open_work/data/models/form_status/form_status.dart';
import 'package:open_work/utils/file_importer/file_importer.dart';

@immutable
class SkillAddState extends Equatable {
  SkillAddState({
    required this.errorMessage,
    required this.status,
  });

  FormStatus status;
  String errorMessage;

  SkillAddState copyWith({
    FormStatus? status,
    String? errorMessage,
  }) =>
      SkillAddState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}
