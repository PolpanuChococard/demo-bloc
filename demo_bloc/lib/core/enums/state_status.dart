enum StateStatus { init, loading, done, error }

extension StateStatusExtension on StateStatus {
  bool get isLoading => this == StateStatus.loading;
  bool get isDone => this == StateStatus.done;
}
