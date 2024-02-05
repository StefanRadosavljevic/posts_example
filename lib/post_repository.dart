import 'package:analytics_frontend/post.dart';
import 'package:dio/dio.dart';

class PostRepository {
  final Dio _dio = Dio();

  Future<List<Post>> fetchPosts() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      final List<dynamic> data = response.data;
      return data.map((json) => Post.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load posts: $error');
    }
  }
}
