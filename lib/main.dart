import 'package:analytics_frontend/analytics_bloc_observer.dart';
import 'package:analytics_frontend/cubit/post_cubit.dart';
import 'package:analytics_frontend/post_list_page.dart';
import 'package:analytics_frontend/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  Bloc.observer = AnalyticsBlocObserver();
  runApp(const AppProvider());
}

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(
          create: (_) => PostCubit(postRepository: PostRepository()),
        ),
      ],
      child: const MaterialApp(
        home: PostListPage(),
      ),
    );
  }
}
