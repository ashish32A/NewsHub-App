import 'package:flutter/material.dart';
import 'package:newshub/Pages/widgets/bottomNav.dart';

import '../Model/category_model.dart';
import '../services/data.dart';
import 'category_news.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<CategoryModel> categories = [];
  @override
  void initState() {
    categories = getcategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'CATEGORIES',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: const Bottomnav(),

        // ignore: dead_code
        body: Container(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    image: categories[index].Image,
                    categoryName: categories[index].categoryName,
                  );
                })));
  }
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;
  const CategoryTile({super.key, this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(name: categoryName)));
      },
      child: Material(
        elevation: 0.5,
        child: Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
          padding: const EdgeInsets.only(bottom: 10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  height: 200,
                  fit: BoxFit.cover,
                  width: 400,
                ),
              ),
              Container(
                  height: 200,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black38),
                  child: Center(
                      child: Text(
                    categoryName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
