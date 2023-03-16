class MyResponse {
  String errorMessage;
  int? statusCode;
  dynamic data;

  MyResponse({
    this.errorMessage="",
    this.data,
    this.statusCode,
  });
}
