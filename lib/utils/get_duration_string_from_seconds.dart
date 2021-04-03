String getDurationStringFromSeconds(int secondsDuration) {
  int hours = (secondsDuration / 3600).floor();
  int minutes = ((secondsDuration - hours * 3600) / 60).floor();
  int seconds = ((secondsDuration - minutes * 60 - hours * 3600));

  if (hours > 0) {
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  if (minutes > 0) {
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  return seconds.toString().padLeft(2, '0');
}
