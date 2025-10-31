abstract final class Routes {
  static const String todos = '/todos';
  static String todoDetail(String id) => '$todos/$id';
}
