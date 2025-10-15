import 'dart:convert' show Utf8Decoder, jsonDecode, jsonEncode;
import 'dart:io' show HttpClient, HttpException;

import 'package:mvvm_course/utils/result/result.dart';
import 'package:mvvm_course/extensions/todo.mapper.dart';
import '../../../domain/models/todo.model.dart';

class ApiClient {
  final String _host;
  final int _port;
  final HttpClient Function() _clientHttpFactory;

  ApiClient({String? host, int? port, HttpClient Function()? clientHttpFactory})
    : _host = host ?? 'localhost',
      _port = port ?? 3000,
      _clientHttpFactory = clientHttpFactory ?? HttpClient.new;

  Future<Result<List<Todo>>> getTodos() async {
    final client = _clientHttpFactory();
    try {
      final request = await client.get(_host, _port, '/todos');
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(const Utf8Decoder()).join();
        final jsonData = jsonDecode(stringData) as List<dynamic>;
        final List<Todo> todos = jsonData
            .map((e) => (e as Map<String, dynamic>).toTodo())
            .toList();
        return Result.ok(todos);
      }

      return Result.err(const HttpException('Failed to load todos'));
    } on Exception catch (e) {
      return Result.err(e);
    } finally {
      client.close();
    }
  }

  Future<Result<Todo>> postTodo(Todo todo) async {
    final client = _clientHttpFactory();
    try {
      final request = await client.post(_host, _port, '/todos');
      request.write(jsonEncode(todo.toCreateJson()));
      final response = await request.close();

      if (response.statusCode == 201) {
        final stringData = await response.transform(Utf8Decoder()).join();
        final jsonData = jsonDecode(stringData) as Map<String, dynamic>;
        final Todo newTodo = jsonData.toTodo();
        return Result.ok(newTodo);
      }

      return Result.err(const HttpException('Failed to create todo'));
    } on Exception catch (e) {
      return Result.err(e);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> deleteTodo(Todo todo) async {
    final client = _clientHttpFactory();
    try {
      final request = await client.delete(_host, _port, '/todos/${todo.id}');
      final result = await request.close();

      if (result.statusCode == 200) {
        return Result.ok(null);
      }
      return Result.err(const HttpException('Failed to delete todo'));
    } on Exception catch (e) {
      return Result.err(e);
    } finally {
      client.close();
    }
  }
}
