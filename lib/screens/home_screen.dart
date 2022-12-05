import 'package:flutter/material.dart';
import 'package:news_app_ui/models/article_model.dart';
import 'package:news_app_ui/screens/article_screen.dart';
import 'package:news_app_ui/widgets/bottom_navbar.dart';
import 'package:news_app_ui/widgets/constom_tag.dart';
import 'package:news_app_ui/widgets/image_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    Article article = Article.articles[0];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        index: 0,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          NewsOfTheDay(article: article),
          BreakingNews(
            article: Article.articles,
          )
        ],
      ),
    );
  }
}

class BreakingNews extends StatelessWidget {
  final List<Article> article;

  const BreakingNews({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                'More',
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: article.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ArticleScreen.routeName,
                      arguments: article[index]);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageContainer(
                            width: MediaQuery.of(context).size.width * 0.5,
                            imageUrl: article[index].imageUrl,
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            article[index].title,
                            maxLines: 4,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${DateTime.now().difference(article[index].createdAt).inHours} hours ago',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'by ${article[index].author}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class NewsOfTheDay extends StatelessWidget {
  const NewsOfTheDay({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      imageUrl: article.imageUrl,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomTag(backGroundColor: Colors.grey.withAlpha(150), children: [
            Text(
              'News of the day',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  ),
            )
          ]),
          const SizedBox(height: 10),
          Text(
            article.title,
            maxLines: 3,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Learn more',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
