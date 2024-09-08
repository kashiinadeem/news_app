import 'package:flutter/material.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/features/News/data/models/article_model.dart';
import 'package:news_app/features/News/presentation/pages/newz_detail_page.dart';

class NewzFeedWidget extends StatelessWidget {
  final Articles article;
  const NewzFeedWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewzDetailPage(article: article))),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Text(
                article.title.toString(),
                style: context.h1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              context.h10,
              Text(
                article.description.toString(),
                style: context.b1,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )),
          if (article.urlToImage != null) context.w10,
          if (article.urlToImage != null)
            Expanded(
              child: ClipRRect(
                borderRadius: context.r10,
                child: ShaderMask(
                  blendMode: BlendMode.srcOver,
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                            tileMode: TileMode.clamp,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, context.foreground!])
                        .createShader(bounds);
                  },
                  child: Image(
                    width: context.width,
                    // height: context.height,
                    fit: BoxFit.cover,
                    image: NetworkImage(article.urlToImage.toString()),
                    errorBuilder: (context, error, stackTrace) {
                      return const Material();
                    },
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
