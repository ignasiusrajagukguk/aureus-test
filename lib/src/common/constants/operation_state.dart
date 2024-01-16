class OperationState {
  ProgressState progressState = ProgressState.none;
  dynamic data;
}

enum ProgressState {
  none,
  onProgress,
  onSuccess,
  onError,
}
