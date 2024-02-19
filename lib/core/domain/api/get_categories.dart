class GetCategoriesResponse {
  GetCategoriesResponse({this.categories});

  List<String>? categories;

  factory GetCategoriesResponse.fromJson(List<dynamic> jsonList) {
    return GetCategoriesResponse(
      categories: jsonList.cast<String>(),
    );
  }
}
