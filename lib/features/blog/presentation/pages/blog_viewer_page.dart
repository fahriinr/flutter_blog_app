import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/calculating_reading_time.dart';
import 'package:blog_app/core/utils/format_date.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:flutter/material.dart';

class BlogViewerPage extends StatelessWidget {
  static route(Blog blog) =>
      MaterialPageRoute(builder: (context) => BlogViewerPage(blog: blog));
  final Blog blog;
  const BlogViewerPage({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  'By ${blog.posterName!}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${formatDateBydMMMYYYY(blog.updatedAt)} . ${calculateReadingTime(blog.content)} min',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppPallete.greyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Image.network(blog.imageUrl, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  blog.content,
                  style: TextStyle(fontSize: 16, wordSpacing: 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
