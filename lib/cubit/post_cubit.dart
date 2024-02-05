import 'package:analytics_frontend/post.dart';
import 'package:analytics_frontend/post_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.dart';
part 'post_cubit.freezed.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository postRepository;

  PostCubit({required this.postRepository}) : super(const PostState.initial());

  Future<void> getPosts() async {
    emit(const PostState.loading());

    try {
      final List<Post> posts = await postRepository.fetchPosts();
      emit(PostState.loaded(posts));
    } catch (error) {
      emit(PostState.error(error.toString()));
    }
  }
}
