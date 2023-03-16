part of 'client_profile_bloc.dart';

// ignore: must_be_immutable
class ClientProfileState extends Equatable {
  ClientProfileState({
    required this.status,
    required this.clientInfoModel,
    required this.clientInfoBaseModel,
    required this.errorMessage,
  });

  ClientStatus status;
  UserInfoModel clientInfoModel;
  UserInfoBaseModel clientInfoBaseModel;
  String errorMessage;

  ClientProfileState copyWith({
    ClientStatus? status,
    UserInfoModel? clientInfoModel,
    UserInfoBaseModel? clientInfoBaseModel,
    String? errorMessage,
  }) =>
      ClientProfileState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        clientInfoBaseModel: clientInfoBaseModel ?? this.clientInfoBaseModel,
        clientInfoModel: clientInfoModel ?? this.clientInfoModel,
      );

  @override
  List<Object?> get props => [
        status,
        clientInfoBaseModel,
        errorMessage,
        clientInfoBaseModel,
      ];
}

enum ClientStatus {
  //PURE
  PURE,

  //GET WORKER INFO

  GETTINGCLIENTINFOINPROGRESS,
  GETTINGCLIENTINFOINSUCCESS,
  GETTINGCLIENTINFOINFAILURY,

  //DELETE WORKER

  DELETINGCLIENTINPROGRESS,
  DELETINGCLIENTINSUCCESS,
  DELETINGCLIENTINFAILURY,

  //UPDATE WORKER INFO

  UPDATECLIENTINFOINPROGRESS,
  UPDATECLIENTINFOINSUCCESS,
  UPDATECLIENTINFOINFAILURY,
}
