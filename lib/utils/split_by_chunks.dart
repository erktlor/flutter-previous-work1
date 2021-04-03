List<List<T>> splitByChunks<T>(List<T> items, int chunksNumbers) {
  List<List<T>> chunks = [];

  for (var i = 0; i < items.length; i += chunksNumbers) {
    chunks.add(items.sublist(i,
        i + chunksNumbers > items.length ? items.length : i + chunksNumbers));
  }

  return chunks;
}
