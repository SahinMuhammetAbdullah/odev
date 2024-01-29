class Categories {
  final List<String> categories = [];

  Categories() {
    categories.add('car');
    categories.add('chemical');
    categories.add('glass');
    categories.add('food');
    categories.add('machinery');
    categories.add('cement');
  }

  String getCategoryByIndex(int index) {
    if (index >= 0 && index < categories.length) {
      return categories[index];
    } else {
      return 'Invalid index';
    }
  }
}
