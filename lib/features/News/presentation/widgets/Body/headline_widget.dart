import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/extensions/context.dart';
import 'package:news_app/features/News/data/models/article_model.dart';

class HeadlineWidget extends StatelessWidget {
  final Articles article;
  const HeadlineWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.8,
      height: context.height,
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
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
              Padding(
                padding: context.p20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: onPinArticle,
                        selectedIcon: Icon(
                          CupertinoIcons.pin_fill,
                          color: context.background,
                        ),
                        icon: Icon(
                          CupertinoIcons.pin,
                          color: context.background,
                        )),
                    Text(
                      article.title.toString(),
                      style: context.h2?.copyWith(color: context.background),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      article.description.toString(),
                      style: context.c1?.copyWith(color: context.background),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPinArticle() {}
}
