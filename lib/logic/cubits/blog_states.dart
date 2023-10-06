import 'package:flutter_blog_explorer/data/model/blogs_model.dart';

abstract class BlogState {}

class BlogLoadingState extends BlogState {}

class BlogLoadedState extends BlogState {
  final List<Blogs> blogs;
  BlogLoadedState(this.blogs);
}

class BlogErrorState extends BlogState {
  final String error;
  BlogErrorState(this.error);
}
