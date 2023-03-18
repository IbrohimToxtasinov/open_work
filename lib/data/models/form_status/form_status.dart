
enum FormStatus {
  pure,
  loading,
  success,
  failure,

  //GET
  gettingInProgress,
  gettingInFailure,
  gettingInSuccess,

  //DELETE

  deletingInProgress,
  deletingInSuccess,
  deletingInFailure,

  //CREATE

  creatingInProgress,
  creatingInSuccess,
  creatingInFailure,

  gettingWorkerInfoInProgress,
  gettingWorkerInfoInSuccess,
  gettingWorkerInfoInFailury,

  //DELETE WORKER

  deletingWorkerInfoInProgress,
  deletingWorkerInfoInSuccess,
  deletingWorkerInfoInFailury,

  //UPDATE WORKER INFO

  updateWorkerInfoInProgress,
  updateWorkerInfoInSuccess,
  updateWorkerInfoInFailury,
}