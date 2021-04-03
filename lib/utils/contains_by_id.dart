bool containsById(List<dynamic> items, dynamic item) {
  final index = items.indexWhere((element) => element.id == item.id);

  return index != -1;
}
