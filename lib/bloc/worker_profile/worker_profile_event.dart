part of 'worker_profile_bloc.dart';

abstract class WorkerProfileEvent {}

class GetWorkerInfoEvent extends WorkerProfileEvent{}
class DeleteWorkerEvent extends WorkerProfileEvent{}
class UpdateWorkerInfoEvent extends WorkerProfileEvent{
  // name: name, surname: surname, email: email, phone: phone, password: password

  String name;
  String surname;
  String email;
  String phone;
  String password;
  XFile image;

  UpdateWorkerInfoEvent({
    required this.password,
    required this.phone,
    required this.email,
    required this.surname,
    required this.name,
     required this.image
});
}
