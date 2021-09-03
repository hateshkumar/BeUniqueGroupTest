import 'package:Test/models/category_result.dart';
import 'package:Test/models/profile_result.dart';

class getCategory {

  getCategory();
}

class GotCategoryResults {
  final Category results;

  GotCategoryResults({this.results});
}

class CategoryFailed {}


class getProfile {

  getProfile();
}

class GotProfileResults {
  final ProfileModel results;

  GotProfileResults({this.results});
}

class ProfileFailed {}