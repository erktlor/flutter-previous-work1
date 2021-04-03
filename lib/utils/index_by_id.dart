int indexById(List<dynamic> items, dynamic item) {
  return items.indexWhere((element) => element.id == item.id);
}
