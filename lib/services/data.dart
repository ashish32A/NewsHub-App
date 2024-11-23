import '../Model/category_model.dart';

List<CategoryModel> getcategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName = "Entertainment";
  categoryModel.Image = "assets/Images/entertaiment.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "General";
  categoryModel.Image = "assets/Images/general1.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Health";
  categoryModel.Image = "assets/Images/health.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Science";
  categoryModel.Image = "assets/Images/science.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.Image = "assets/Images/sports.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Buisness";
  categoryModel.Image = "assets/Images/buisess.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  return category;
}
