import 'package:flutter/material.dart';
import 'package:news_app_ui/models/article_model.dart';
import 'package:news_app_ui/screens/article_screen.dart';
import 'package:news_app_ui/screens/home_screen.dart';
import 'package:news_app_ui/widgets/bottom_navbar.dart';
import 'package:news_app_ui/widgets/image_container.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  static const routeName = '/discover';

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ['health', 'politics', 'art', 'food', 'science'];
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          index: 1,
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [DiscoverNews(), CategoryNews(tabs: tabs)],
        ),
      ),
    );
  }
}

class CategoryNews extends StatelessWidget {
  const CategoryNews({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    final article = Article.articles;
    return Column(
      children: [
        TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            tabs: tabs
                .map((e) => Tab(
                      icon: Text(
                        e,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ))
                .toList()),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: TabBarView(
              children: tabs
                  .map((e) => ListView.builder(
                        padding: EdgeInsets.all(10.0),
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemCount: article.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, ArticleScreen.routeName,
                              arguments: article[index]);
                            },
                            child: Row(
                              children: [
                                ImageContainer(
                                    margin: EdgeInsets.all(5.0),
                                    height: 100,
                                    width: 100,
                                    imageUrl: article[index].imageUrl),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        article[index].title,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.schedule,
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${DateTime.now().difference(article[index].createdAt).inHours} hours ago',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${article[index].views} views',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  color: Colors.grey,
                                                ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ))
                  .toList()),
        )
      ],
    );
  }
}

class DiscoverNews extends StatelessWidget {
  const DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Discover',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 5),
            Text(
              'News from all around the world',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'search',
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.tune,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none)),
            )
          ],
        ),
      ),
    );
  }
}
