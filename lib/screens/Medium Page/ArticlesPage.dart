import 'package:dsc_client/screens/Medium%20Page/Articles.dart';
import 'package:dsc_client/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'ArticleTile.dart';
import 'articleClass.dart';

class ArticlesPage extends StatefulWidget {
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  List<Article> articles = <Article>[];

  Articles art = Articles();

  bool loading = true;

  @override
  void initState() {
    loading = true;
    getArticles();
    super.initState();
  }

  getArticles() async {
    await art.getArticles();
    articles = art.articles;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                          child: Image.asset(
                        "assets/images/logo.png",
                        height: 80,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      flex: 8,
                      child: SingleChildScrollView(
                        child: Container(
                          child: ListView.builder(
                              itemCount: articles.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ArticleTile(
                                  author: articles[index].author!,
                                  title: articles[index].title!,
                                  url: articles[index].url!,
                                  urlToImage: articles[index].urlToImage!,
                                );
                              }),
                        ),
                      ))
                ],
              ),
            ),
          );
  }
}
