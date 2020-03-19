int getCurrentTime() {
    DateTime time = DateTime.now();
    int ms = time.millisecondsSinceEpoch;
    int currentTimeInSecs = (ms / 1000).round();
    return currentTimeInSecs;
}