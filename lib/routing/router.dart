import 'package:go_router/go_router.dart';
import 'package:mvvm_course/routing/routes.dart';
import 'package:mvvm_course/ui/todo_details/widgets/todo_details.screen.dart';

import '../data/repositories/todos/todos_remote.repository.dart';
import '../data/services/api/api_client.dart';
import '../ui/todo/view_models/todo.view_model.dart';
import '../ui/todo/widgets/todo.screen.dart';
import '../ui/todo_details/view_models/todo_details.view_model.dart';

GoRouter routerConfig() {
  final todoRepo = TodosRemoteRepository(
    apiClient: ApiClient(host: "192.168.2.104"),
  );

  return GoRouter(
    initialLocation: Routes.todos,
    routes: [
      GoRoute(
        path: Routes.todos,
        builder: (context, state) {
          return TodoScreen(viewModel: TodoViewModel(todoRepository: todoRepo));
        },
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              final TodoDetailsViewModel todoDetailsViewModel =
                  TodoDetailsViewModel(todoRepository: todoRepo);

              todoDetailsViewModel.load.execute(id);

              return TodoDetailsScreen(viewModel: todoDetailsViewModel, id: id);
            },
          ),
        ],
      ),
    ],
  );
}
