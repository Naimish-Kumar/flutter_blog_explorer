import 'dart:convert';
import 'package:flutter_blog_explorer/data/model/blogs_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BlogRepository {
  Future<List<Blogs>?> fetchBlogs() async {
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final Response response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        final data = jsonDecode(response.body);
        List<dynamic> blogs = data['blogs'];
         return blogs.map((e) => Blogs.fromJson(e)).toList();
          
      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      throw e;
    }
  }
}
