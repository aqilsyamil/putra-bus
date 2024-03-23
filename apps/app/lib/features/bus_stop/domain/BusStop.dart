class BusStop {
  final String name;
  final String shortName;
  final bool isStarred;
  final Function() onStarPressed;
  final Function() onSelect;
  final String imagePath;

  BusStop({
    required this.name,
    required this.shortName,
    required this.isStarred,
    required this.onStarPressed,
    required this.onSelect,
    required this.imagePath,
  });
}