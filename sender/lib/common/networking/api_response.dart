// ignore_for_file: constant_identifier_names

enum Status { LOADING, SUCCESS, ERROR }

class APIResponse<T> {
  String? message;
  T? data;
  Status status;

  APIResponse.loading(this.message) : status = Status.LOADING;

  APIResponse.success(this.message, this.data) : status = Status.SUCCESS;

  APIResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return 'APIResponse{message: $message, data: $data, status: $status}';
  }
}
