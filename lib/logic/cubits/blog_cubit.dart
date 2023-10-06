import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_explorer/data/model/blogs_model.dart';
import 'package:flutter_blog_explorer/data/repository/blog_repository.dart';
import 'package:flutter_blog_explorer/logic/cubits/blog_states.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogLoadingState()) {
    fetchBlogs();
  }
  BlogRepository repository = BlogRepository();

  void fetchBlogs() async {
    try {
      List<Blogs>? blogs = await repository.fetchBlogs();
      emit(BlogLoadedState(blogs!));
    } catch (e) {
      emit(BlogErrorState(e.toString()));
    }
  }
}
