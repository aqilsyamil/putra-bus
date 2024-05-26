class Coordinate {
  const Coordinate(this.latitude, this.longitude);

  final double latitude;
  final double longitude;

  get props => [latitude, longitude];
}
