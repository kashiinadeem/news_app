import 'package:flutter/material.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/core/extensions/date.dart';
import 'package:news_app/core/extensions/strings.dart';
import 'package:news_app/features/News/data/models/article_model.dart';

class NewzDetailPage extends StatelessWidget {
  final Articles article;
  const NewzDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.p20,
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.star),
                  context.w10,
                  Expanded(
                    child: Text(
                      '${article.author.toString()} ',
                      style: context.h1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  context.w10,
                  Text(
                    ':Author',
                    style: context.c1,
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 25.0,
                  ),
                  context.w10,
                  Text(
                    '${article.publishedAt.toString().toDate.parsedDate} ',
                    style: context.b1,
                  ),
                  context.w10,
                  Text(
                    'On Air',
                    style: context.b1,
                  )
                ],
              ),
              context.h30,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      article.title.toString(),
                      style: context.hL,
                    ),
                  )
                ],
              ),
              context.h10,
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: context.r10,
                      child: Image(
                        // height: context.height,
                        fit: BoxFit.cover,
                        image: NetworkImage(article.urlToImage.toString()),
                        errorBuilder: (context, error, stackTrace) {
                          return const Material();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              context.h10,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      article.description.toString(),
                      style: context.c1,
                    ),
                  )
                ],
              ),
              context.h30,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Description',
                      style: context.h1,
                    ),
                  )
                ],
              ),
              context.h10,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      article.content.toString(),
                      style: context.b1,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
