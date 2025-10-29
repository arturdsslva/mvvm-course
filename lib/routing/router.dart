import 'package:go_router/go_router.dart';
import 'package:mvvm_course/routing/routes.dart';

import '../data/repositories/todos/todos_remote.repository.dart';
import '../data/services/api/api_client.dart';
import '../ui/todo/view_models/todo.view_model.dart';
import '../ui/todo/widgets/todo.screen.dart';

GoRouter routerConfig() {
  return GoRouter(
    initialLocation: Routes.todos,
    routes: [
      GoRoute(
        path: Routes.todos,
        builder: (context, state) {
          return TodoScreen(
            viewModel: TodoViewModel(
              todoRepository: TodosRemoteRepository(
                apiClient: ApiClient(host: "192.168.2.100"),
              ),
            ),
          );
        },
      ),
    ],
  );
}
