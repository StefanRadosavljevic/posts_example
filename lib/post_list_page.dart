import 'package:analytics_frontend/cubit/post_cubit.dart';
import 'package:analytics_frontend/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSONPlaceholder Freezed Demo'),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => _buildInitial(),
            loading: (_) => _buildLoading(),
            error: (error) => _buildError(error.errorMessage),
            loaded: (loaded) => _buildLoaded(loaded.posts),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostCubit>().getPosts();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildInitial() {
    return const Center(
      child: Text('Press the button to load posts.'),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(String errorMessage) {
    return Center(
      child: Text('Error: $errorMessage'),
    );
  }

  Widget _buildLoaded(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text(post.title),
          subtitle: Text(post.body),
        );
      },
    );
  }
}
