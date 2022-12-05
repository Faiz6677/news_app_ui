import 'package:flutter/material.dart';
import 'package:news_app_ui/models/article_model.dart';
import 'package:news_app_ui/screens/home_screen.dart';
import 'package:news_app_ui/widgets/constom_tag.dart';
import 'package:news_app_ui/widgets/image_container.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ImageContainer(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        imageUrl: article.imageUrl,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            HeadlineNews(article: article),
            Container(
              padding: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.55,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20.0))),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomTag(backGroundColor: Colors.black, children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundImage: NetworkImage(article.authorImageUrl),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          article.author,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ]),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomTag(
                          backGroundColor: Colors.grey.shade200,
                          children: [
                            const Icon(
                              Icons.access_time_rounded,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${DateTime.now().difference(article.createdAt).inHours} h',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            )
                          ]),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomTag(
                          backGroundColor: Colors.grey.shade200,
                          children: [
                            const Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${article.views}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            )
                          ]),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    article.title,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    article.body,
                    maxLines: 5,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey, height: 1.5),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width: double.infinity,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return ImageContainer(
                              margin: const EdgeInsets.only(right: 5),
                              width: MediaQuery.of(context).size.width * 0.40,
                              height: MediaQuery.of(context).size.height * 0.23,
                              imageUrl: article.imageUrl);
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeadlineNews extends StatelessWidget {
  const HeadlineNews({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTag(backGroundColor: Colors.grey.withAlpha(170), children: [
              Text(
                article.category,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.title,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 10),
            Text(
              article.subtitle,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
