import 'package:flutter/material.dart';

// In Detailed Blog Screen
class DetailedBlogScreen extends StatefulWidget {
  final blog;

  DetailedBlogScreen({required this.blog});

  @override
  _DetailedBlogScreenState createState() => _DetailedBlogScreenState();
}

class _DetailedBlogScreenState extends State<DetailedBlogScreen> {
  get blogBloc => blogBloc;

  bool isLiked = false;
  int likeCount = 0;
  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
      } else {
        likeCount++;
      }
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.blog.title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              child: Container(
            height: 200,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.blog.imageUrl,
                  fit: BoxFit.contain,
                )),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            widget.blog.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Expanded(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: toggleLike,
        label:isLiked? const Text('Liked'):const Text('Like'),
        icon: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          color: isLiked ? const Color.fromARGB(255, 195, 27, 15) : null,
          size: 30,
        ),
      ),
    );
  }
}
