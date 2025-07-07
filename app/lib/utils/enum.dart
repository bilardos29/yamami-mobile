enum TimeoutDuration {
  short(20),
  long(60);

  final int value;
  const TimeoutDuration(this.value);
}