String getTimeFromSeconds(int sec) {
  final minutes = (sec / 60).floor();
  final seconds = sec - minutes * 60;

  return minutes.toString().padLeft(2, '0') +
      ':' +
      seconds.toString().padLeft(2, '0');
}
