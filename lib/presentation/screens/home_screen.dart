import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_explorer/logic/cubits/blog_cubit.dart';
import 'package:flutter_blog_explorer/logic/cubits/blog_states.dart';

import '../../data/model/blogs_model.dart';
import 'detailed_blog_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News Explorer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: BlocConsumer<BlogCubit, BlogState>(
          builder: (context, state) {
            if (state is BlogLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is BlogLoadedState) {
              return buildBlogListView(state.blogs);
            }
            return AlertDialog.adaptive(
              icon: const Icon(
                Icons.wifi_off,
                color: Colors.red,
                size: 50,
              ),
              titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.blue),
              title: const Text('Content Loading failed.'),
              content: const Text(
                'Please check internet connectivity. than try again.',
                style: TextStyle(fontSize: 16),
              ),
              contentPadding: const EdgeInsets.only(left: 30, right: 8),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      BlogLoadingState();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Try Again',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            );
          },
          listener: (context, state) {
            
            if (state is BlogErrorState) {
              SnackBar snackBar = const SnackBar(
                content: Text('Content Loading failed'),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {}
          },
        ),
      ),
    );
  }

  Widget buildBlogListView(List<Blogs> blogs) {
    return ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          final blog = blogs[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        blog.imageUrl.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      blog.title.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(blog.id.toString()),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailedBlogScreen(blog: blog),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
